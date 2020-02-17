Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1033C1609B5
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 05:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgBQE6E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 23:58:04 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47352 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgBQE6E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 23:58:04 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 14CF4886BF;
        Mon, 17 Feb 2020 17:58:01 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581915481;
        bh=rmPD0TVv0HFiSsX5Zo7/Cz2ygUaEYWTveBuSLIiTTCk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=YZIEadU6MGu6UuOYUgwHv+jbaWcrxP4IlSB6CXQWyyqias+4WU8qhTeziwY2Jn+j4
         i2uf0WJ/vgqZ1PeID16XpyEty3tOL/4KQYo+yABru+qWNXgq7Q78N4PA7+n36eONGd
         fCqEkSrn6/LfbOGtzZzU89ACAvjNADuCLd4XMXh216SQYjcVUkgvkkwj3NI67s8/LG
         R7mHOiv4j+7/N9qAma7LcdoNq3S4Vo6Gqmm783TP/jB+V9SGRgcZDHTBbGk2BaL5X5
         raeQGso9wRnkzLQbZoZObWv++RcOnBI1IjRU46OT9wS3Iv4wtvLryNd29QOVY8SJs1
         pflz7TNLTTAhA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e4a1d590001>; Mon, 17 Feb 2020 17:58:01 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1473.3; Mon, 17 Feb 2020 17:58:01 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1473.005; Mon, 17 Feb 2020 17:58:01 +1300
From:   Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To:     "f4bug@amsat.org" <f4bug@amsat.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Chris Packham" <Chris.Packham@alliedtelesis.co.nz>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Thread-Topic: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Thread-Index: AQHV4SHSVRoGjPvrsEumWNBlTnig6agdtJQAgABM4QA=
Date:   Mon, 17 Feb 2020 04:58:00 +0000
Message-ID: <8e852d84c8b0c6b35faa3b3f2a1034d93a6e8967.camel@alliedtelesis.co.nz>
References: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
         <CAAdtpL5Tf-8O=xMKO33DWDs=2_Hsdk=FQSNO5Gsrx=9hWvENdg@mail.gmail.com>
In-Reply-To: <CAAdtpL5Tf-8O=xMKO33DWDs=2_Hsdk=FQSNO5Gsrx=9hWvENdg@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:c5e8:4211:e014:126a]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D68F6C6CB23C24EA488F1138B97366C@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgUGhpbCwNCg0KT24gTW9uLCAyMDIwLTAyLTE3IGF0IDAxOjIyICswMTAwLCBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSB3cm90ZToNCj4gSGkgTWFyaywNCj4gDQo+IE9uIFR1ZSwgRmViIDExLCAy
MDIwIGF0IDEwOjQyIFBNIE1hcmsgVG9tbGluc29uDQo+IDxtYXJrLnRvbWxpbnNvbkBhbGxpZWR0
ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4gPiANCj4gPiBUaGUgQ2F2aXVtIE9jdGVvbiBDUFUgdXNl
cyBhIHNwZWNpYWwgc3luYyBpbnN0cnVjdGlvbiBmb3IgaW1wbGVtZW50aW5nDQo+ID4gd21iLCBh
bmQgZHVlIHRvIGEgQ1BVIGJ1ZywgdGhlIGluc3RydWN0aW9uIG11c3QgYXBwZWFyIHR3aWNlLiBB
IG1hY3JvDQo+ID4gaGFkIGJlZW4gZGVmaW5lZCB0byBoaWRlIHRoaXM6DQo+ID4gDQo+ID4gICNk
ZWZpbmUgX19TWU5DX3JwdCh0eXBlKSAgICAgKDEgKyAodHlwZSA9PSBfX1NZTkNfd21iKSkNCj4g
PiANCj4gPiB3aGljaCB3YXMgaW50ZW5kZWQgdG8gZXZhbHVhdGUgdG8gMiBmb3IgX19TWU5DX3dt
YiwgYW5kIDEgZm9yIGFueSBvdGhlcg0KPiA+IHR5cGUgb2Ygc3luYy4gSG93ZXZlciwgdGhpcyBl
eHByZXNzaW9uIGlzIGV2YWx1YXRlZCBieSB0aGUgYXNzZW1ibGVyLA0KPiA+IGFuZCBub3QgdGhl
IGNvbXBpbGVyLCBhbmQgdGhlIHJlc3VsdCBvZiAnPT0nIGluIHRoZSBhc3NlbWJsZXIgaXMgMCBv
cg0KPiA+IC0xLCBub3QgMCBvciAxIGFzIGl0IGlzIGluIEMuIFRoZSBuZXQgcmVzdWx0IHdhcyB3
bWIoKSBwcm9kdWNpbmcgbm8gY29kZQ0KPiA+IGF0IGFsbC4gVGhlIHNpbXBsZSBmaXggaW4gdGhp
cyBwYXRjaCBpcyB0byBjaGFuZ2UgdGhlICcrJyB0byAnLScuDQo+IA0KPiBJc24ndCB0aGlzIHBh
cnRpY3VsYXIgdG8gdGhlIGFzc2VtYmxlciBpbXBsZW1lbnRhdGlvbj8NCj4gQ2FuIHlvdSBleHBs
aWNpdCB0aGUgYXNzZW1ibGVyIHlvdSBhcmUgdXNpbmcgaW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlv
bj8NCj4gQXNzdW1pbmcgd2UgaGF2ZSB0byBsb29rIGF0IHlvdXIgY29tbWl0IGluIDMgeWVhcnMg
ZnJvbSBub3csIHdlJ2xsDQo+IHdvbmRlciB3aGF0IGFzc2VtYmxlciB5b3Ugd2VyZSB1c2luZy4N
Cj4gDQo+IFRoYW5rcywNCj4gDQo+IFBoaWwuDQoNClllcywgaXQgaXMgdGllZCB0byB0aGUgYXNz
ZW1ibGVyLiBCdXQgdGhlIExpbnV4IGtlcm5lbCBpcyB0aWVkIHRvIEdDQywNCmFuZCBHQ0MgKEkg
YmVsaWV2ZSkgaXMgdGllZCB0byBHTlUgYXMuIEkgY2FuJ3Qgc2VlIHRoZSBzcGVjaWZpY2F0aW9u
IG9mDQpHTlUgYXMgY2hhbmdpbmcsIHNpbmNlIHRoYXQgY291bGQgYnJlYWsgYW55dGhpbmcgd3Jp
dHRlbiBmb3IgaXQuDQoNCg0KPiA+IEZpeGVzOiBiZjkyOTI3MjUxYjMgKCJNSVBTOiBiYXJyaWVy
OiBBZGQgX19TWU5DKCkgaW5mcmFzdHJ1Y3R1cmUiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsg
VG9tbGluc29uIDxtYXJrLnRvbWxpbnNvbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiA+IC0tLQ0K
PiA+ICBhcmNoL21pcHMvaW5jbHVkZS9hc20vc3luYy5oIHwgNCArKystDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3N5bmMuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2Fz
bS9zeW5jLmgNCj4gPiBpbmRleCA3YzZhMTA5NWY1Li5hYWJkMDk3OTMzIDEwMDY0NA0KPiA+IC0t
LSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeW5jLmgNCj4gPiArKysgYi9hcmNoL21pcHMvaW5j
bHVkZS9hc20vc3luYy5oDQo+ID4gQEAgLTE1NSw5ICsxNTUsMTEgQEANCj4gPiAgICogZWZmZWN0
aXZlIGJhcnJpZXIgYXMgbm90ZWQgYnkgY29tbWl0IDZiMDdkMzhhYWE1MiAoIk1JUFM6IE9jdGVv
bjogVXNlDQo+ID4gICAqIG9wdGltaXplZCBtZW1vcnkgYmFycmllciBwcmltaXRpdmVzLiIpLiBI
ZXJlIHdlIHNwZWNpZnkgdGhhdCB0aGUgYWZmZWN0ZWQNCj4gPiAgICogc3luYyBpbnN0cnVjdGlv
bnMgc2hvdWxkIGJlIGVtaXR0ZWQgdHdpY2UuDQo+ID4gKyAqIE5vdGUgdGhhdCB0aGlzIGV4cHJl
c3Npb24gaXMgZXZhbHVhdGVkIGJ5IHRoZSBhc3NlbWJsZXIgKG5vdCB0aGUgY29tcGlsZXIpLA0K
PiA+ICsgKiBhbmQgdGhhdCB0aGUgYXNzZW1ibGVyIGV2YWx1YXRlcyAnPT0nIGFzIDAgb3IgLTEs
IG5vdCAwIG9yIDEuDQo+ID4gICAqLw0KPiA+ICAjaWZkZWYgQ09ORklHX0NQVV9DQVZJVU1fT0NU
RU9ODQo+ID4gLSMgZGVmaW5lIF9fU1lOQ19ycHQodHlwZSkgICAgICAoMSArICh0eXBlID09IF9f
U1lOQ193bWIpKQ0KPiA+ICsjIGRlZmluZSBfX1NZTkNfcnB0KHR5cGUpICAgICAgKDEgLSAodHlw
ZSA9PSBfX1NZTkNfd21iKSkNCj4gPiAgI2Vsc2UNCj4gPiAgIyBkZWZpbmUgX19TWU5DX3JwdCh0
eXBlKSAgICAgIDENCj4gPiAgI2VuZGlmDQo+ID4gLS0NCj4gPiAyLjI1LjANCj4gPiANCg0K
