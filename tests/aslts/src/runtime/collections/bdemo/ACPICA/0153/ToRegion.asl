/*
 * Some or all of this work - Copyright (c) 2006 - 2016, Intel Corp.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * Neither the name of Intel Corporation nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


/*
 * Store Integer/String/Buffer/Package to OperationRegion
 */

// Integer

Method(md44,, Serialized)
{
	Name(i000, 0xe0385bcd)
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(i000, OOO2)
	Store (0x61, OOO2)

	Store(DeRefof(Refof(OOO2)), Local1)

	if (LNotEqual(Local1, 0x61)) {
		err("", zFFF, 0xa00, 0, 0, Local1, 0x61)
	}
	if (LNotEqual(i000, 0xe0385bcd)) {
		err("", zFFF, 0xa01, 0, 0, i000, 0xe0385bcd)
	}
}

// String

Method(md45,, Serialized)
{
	Name(s000, "String")
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(s000, OOO2)
	Store(Refof(OOO2), Local0)
	Store (0x61, Index(DeRefof(Local0), 3))

	Store(Refof(OOO2), Local0)
	Store(DeRefof(Local0), Local1)

	if (LNotEqual(Local1, "Strang")) {
		err("", zFFF, 0xa02, 0, 0, Local1, "Strang")
	}
	if (LNotEqual(s000, "String")) {
		err("", zFFF, 0xa03, 0, 0, s000, "String")
	}
}

// Buffer

Method(md46,, Serialized)
{
	Name(b000, Buffer() {1,2,3,4})
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(b000, OOO2)

	Store(Refof(OOO2), Local0)
	Store (0x61, Index(DeRefof(Local0), 3))
	Store(DeRefof(Local0), Local1)

	if (LNotEqual(Local1, Buffer() {1,2,3,0x61})) {
		err("", zFFF, 0xa04, 0, 0, Local1, Buffer() {1,2,3,0x61})
	}
	if (LNotEqual(b000, Buffer() {1,2,3,4})) {
		err("", zFFF, 0xa05, 0, 0, b000, Buffer() {1,2,3,4})
	}
}

// Package

Method(md47,, Serialized)
{
	Name(pppp, Package(1){Buffer() {1,2,3,4}})
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(pppp, OOO2)
	Store(Refof(OOO2), Local0)
	Store (0x61, Index(DerefOf(Index(DeRefof(Local0), 0)), 3))

	// OOO2

	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 0)), Local1)
	if (LNotEqual(Local1, 1)) {
		err("", zFFF, 0xa06, 0, 0, Local1, 1)
	}
	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 1)), Local1)
	if (LNotEqual(Local1, 2)) {
		err("", zFFF, 0xa07, 0, 0, Local1, 2)
	}
	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 2)), Local1)
	if (LNotEqual(Local1, 3)) {
		err("", zFFF, 0xa08, 0, 0, Local1, 3)
	}
	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 3)), Local1)
	if (LNotEqual(Local1, 0x61)) {
		err("", zFFF, 0xa09, 0, 0, Local1, 0x61)
	}

	// pppp

	Store(DeRefof(Index(DerefOf(Index(pppp, 0)), 0)), Local0)
	if (LNotEqual(Local0, 1)) {
		err("", zFFF, 0xa0a, 0, 0, Local0, 1)
	}
	Store(DeRefof(Index(DerefOf(Index(pppp, 0)), 1)), Local0)
	if (LNotEqual(Local0, 2)) {
		err("", zFFF, 0xa0b, 0, 0, Local0, 2)
	}
	Store(DeRefof(Index(DerefOf(Index(pppp, 0)), 2)), Local0)
	if (LNotEqual(Local0, 3)) {
		err("", zFFF, 0xa0c, 0, 0, Local0, 3)
	}
	Store(DeRefof(Index(DerefOf(Index(pppp, 0)), 3)), Local0)
	if (LNotEqual(Local0, 4)) {
		err("", zFFF, 0xa0d, 0, 0, Local0, 4)
	}
}

/* Constant */

// Integer

Method(md48,, Serialized)
{
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(0xe0385bcd, OOO2)
	Store (0x61, OOO2)

	Store(DeRefof(Refof(OOO2)), Local1)

	if (LNotEqual(Local1, 0x61)) {
		err("", zFFF, 0xa0e, 0, 0, Local1, 0x61)
	}
}

// String

Method(md49,, Serialized)
{
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store("String", OOO2)
	Store(Refof(OOO2), Local0)
	Store (0x61, Index(DeRefof(Local0), 3))

	Store(Refof(OOO2), Local0)
	Store(DeRefof(Local0), Local1)

	if (LNotEqual(Local1, "Strang")) {
		err("", zFFF, 0xa0f, 0, 0, Local1, "Strang")
	}
}

// Buffer

Method(md4a,, Serialized)
{
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(Buffer() {1,2,3,4}, OOO2)

	Store(Refof(OOO2), Local0)
	Store (0x61, Index(DeRefof(Local0), 3))
	Store(DeRefof(Local0), Local1)

	if (LNotEqual(Local1, Buffer() {1,2,3,0x61})) {
		err("", zFFF, 0xa10, 0, 0, Local1, Buffer() {1,2,3,0x61})
	}
}

// Package

Method(md4b,, Serialized)
{
	OperationRegion(OOO2, SystemMemory, 0x100, 0x100)

	Store(Package(1){Buffer() {1,2,3,4}}, OOO2)
	Store(Refof(OOO2), Local0)
	Store (0x61, Index(DerefOf(Index(DeRefof(Local0), 0)), 3))

	// OOO2

	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 0)), Local1)
	if (LNotEqual(Local1, 1)) {
		err("", zFFF, 0xa11, 0, 0, Local1, 1)
	}
	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 1)), Local1)
	if (LNotEqual(Local1, 2)) {
		err("", zFFF, 0xa12, 0, 0, Local1, 2)
	}
	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 2)), Local1)
	if (LNotEqual(Local1, 3)) {
		err("", zFFF, 0xa13, 0, 0, Local1, 3)
	}
	Store(DeRefof(Index(DerefOf(Index(DeRefof(Local0), 0)), 3)), Local1)
	if (LNotEqual(Local1, 0x61)) {
		err("", zFFF, 0xa14, 0, 0, Local1, 0x61)
	}
}

Method(md4c)
{
	CH03("", 0, 0xf16, 0, 0)
	md44()
	md45()
	md46()
	md47()
	md48()
	md49()
	md4a()
	md4b()
	CH03("", 0, 0xf17, 0, 0)
}
