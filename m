Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1998161C0E
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 21:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbgBQUBM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 15:01:12 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48205 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbgBQUBM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 15:01:12 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 498DA886BF;
        Tue, 18 Feb 2020 09:01:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581969667;
        bh=QBZPpGPjuA/DDMDV0sM2afefWCRCvpxYLsolO5GIkv0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=YrmI6q0gyPOAp9eR4YFYwB17cKkBzP2GkPtwKonl9meJuGOu/DquZwadL+TBOP+Yp
         RWg5upyoZhHudGlDGn8iJKP98ItCo4c1ja7r5ZfqIqpQM5YefZeCWqNQsZxUhxTygZ
         oSetJ6Xd/Oaf88WM2h88fUQWnvSXL76wLfF6K3YQr+bqXnynLj7KzbqSlPvHETyJc3
         2N/HqhPnZ0WG7aN5S8PyGmSvPxW+97zyFO6cF3QdDS0LDLq0m77pZTqcpbIt9DcNHa
         IdHrdVHhoGogRNcHtUMuVvUpu2CoNS0KT8o/uR8JAvNCC1Jfza7G25bLDQHA39/aUx
         Xt3HM66vl0cLA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e4af1030001>; Tue, 18 Feb 2020 09:01:07 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb 2020 09:01:07 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1473.005; Tue, 18 Feb 2020 09:01:07 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "f4bug@amsat.org" <f4bug@amsat.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Thread-Topic: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Thread-Index: AQHV4SHSo52AlyiF50aUibwtU28qqagdtJQAgABM4QCAAPxTAA==
Date:   Mon, 17 Feb 2020 20:01:06 +0000
Message-ID: <8cb14684e2f774d9573c062f2d82ad5348c5fee7.camel@alliedtelesis.co.nz>
References: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
         <CAAdtpL5Tf-8O=xMKO33DWDs=2_Hsdk=FQSNO5Gsrx=9hWvENdg@mail.gmail.com>
         <8e852d84c8b0c6b35faa3b3f2a1034d93a6e8967.camel@alliedtelesis.co.nz>
In-Reply-To: <8e852d84c8b0c6b35faa3b3f2a1034d93a6e8967.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:cd0e:b78d:99a2:dcbf]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3503B8CCE2A3E142B2D2FF8E27366A7A@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCAyMDIwLTAyLTE3IGF0IDE3OjU4ICsxMzAwLCBNYXJrIFRvbWxpbnNvbiB3cm90ZToN
Cj4gSGkgUGhpbCwNCj4gDQo+IE9uIE1vbiwgMjAyMC0wMi0xNyBhdCAwMToyMiArMDEwMCwgUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+ID4gSGkgTWFyaywNCj4gPiANCj4gPiBPbiBU
dWUsIEZlYiAxMSwgMjAyMCBhdCAxMDo0MiBQTSBNYXJrIFRvbWxpbnNvbg0KPiA+IDxtYXJrLnRv
bWxpbnNvbkBhbGxpZWR0ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gVGhlIENh
dml1bSBPY3Rlb24gQ1BVIHVzZXMgYSBzcGVjaWFsIHN5bmMgaW5zdHJ1Y3Rpb24gZm9yIGltcGxl
bWVudGluZw0KPiA+ID4gd21iLCBhbmQgZHVlIHRvIGEgQ1BVIGJ1ZywgdGhlIGluc3RydWN0aW9u
IG11c3QgYXBwZWFyIHR3aWNlLiBBIG1hY3JvDQo+ID4gPiBoYWQgYmVlbiBkZWZpbmVkIHRvIGhp
ZGUgdGhpczoNCj4gPiA+IA0KPiA+ID4gICNkZWZpbmUgX19TWU5DX3JwdCh0eXBlKSAgICAgKDEg
KyAodHlwZSA9PSBfX1NZTkNfd21iKSkNCj4gPiA+IA0KPiA+ID4gd2hpY2ggd2FzIGludGVuZGVk
IHRvIGV2YWx1YXRlIHRvIDIgZm9yIF9fU1lOQ193bWIsIGFuZCAxIGZvciBhbnkgb3RoZXINCj4g
PiA+IHR5cGUgb2Ygc3luYy4gSG93ZXZlciwgdGhpcyBleHByZXNzaW9uIGlzIGV2YWx1YXRlZCBi
eSB0aGUgYXNzZW1ibGVyLA0KPiA+ID4gYW5kIG5vdCB0aGUgY29tcGlsZXIsIGFuZCB0aGUgcmVz
dWx0IG9mICc9PScgaW4gdGhlIGFzc2VtYmxlciBpcyAwIG9yDQo+ID4gPiAtMSwgbm90IDAgb3Ig
MSBhcyBpdCBpcyBpbiBDLiBUaGUgbmV0IHJlc3VsdCB3YXMgd21iKCkgcHJvZHVjaW5nIG5vIGNv
ZGUNCj4gPiA+IGF0IGFsbC4gVGhlIHNpbXBsZSBmaXggaW4gdGhpcyBwYXRjaCBpcyB0byBjaGFu
Z2UgdGhlICcrJyB0byAnLScuDQo+ID4gDQo+ID4gSXNuJ3QgdGhpcyBwYXJ0aWN1bGFyIHRvIHRo
ZSBhc3NlbWJsZXIgaW1wbGVtZW50YXRpb24/DQo+ID4gQ2FuIHlvdSBleHBsaWNpdCB0aGUgYXNz
ZW1ibGVyIHlvdSBhcmUgdXNpbmcgaW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbj8NCj4gPiBBc3N1
bWluZyB3ZSBoYXZlIHRvIGxvb2sgYXQgeW91ciBjb21taXQgaW4gMyB5ZWFycyBmcm9tIG5vdywg
d2UnbGwNCj4gPiB3b25kZXIgd2hhdCBhc3NlbWJsZXIgeW91IHdlcmUgdXNpbmcuDQo+ID4gDQo+
ID4gVGhhbmtzLA0KPiA+IA0KPiA+IFBoaWwuDQo+IA0KPiBZZXMsIGl0IGlzIHRpZWQgdG8gdGhl
IGFzc2VtYmxlci4gQnV0IHRoZSBMaW51eCBrZXJuZWwgaXMgdGllZCB0byBHQ0MsDQo+IGFuZCBH
Q0MgKEkgYmVsaWV2ZSkgaXMgdGllZCB0byBHTlUgYXMuIEkgY2FuJ3Qgc2VlIHRoZSBzcGVjaWZp
Y2F0aW9uIG9mDQo+IEdOVSBhcyBjaGFuZ2luZywgc2luY2UgdGhhdCBjb3VsZCBicmVhayBhbnl0
aGluZyB3cml0dGVuIGZvciBpdC4NCj4gDQoNClRoZXJlIGlzIGFuIGVmZm9ydCB1bmRlcndheSB0
byBidWlsZCB0aGUga2VybmVsIHdpdGggY2xhbmdbMV0uIEknbSBub3QNCnN1cmUgd2hhdCB0aGF0
IGVuZHMgdXAgdXNpbmcgZm9yIGFuIGFzc2VtYmxlciBvciBpZiBpdCdsbCBldmVuIGJlIGFibGUN
CnRvIHRhcmdldCBtaXBzNjQgYW55dGltZSBzb29uLg0KDQpGb3IgcmVmZXJlbmNlIHRoZSByZWxl
dmFudCBzZWN0aW9uIGZyb20gdGhlIEdOVSBhcyBtYW51YWxbMl0gc2F5cyAiQQ0KdHJ1ZSByZXN1
bHRzIGhhcyBhIHZhbHVlIG9mIC0xIHdoZXJlYXMgYSBmYWxzZSByZXN1bHQgaGFzIGEgdmFsdWUg
b2YNCjAiLg0KDQpbMV0gLSBodHRwczovL2NsYW5nYnVpbHRsaW51eC5naXRodWIuaW8vDQpbMl0g
LSBodHRwczovL3NvdXJjZXdhcmUub3JnL2JpbnV0aWxzL2RvY3MvYXMvSW5maXgtT3BzLmh0bWwj
SW5maXgtT3BzDQoNCg0KDQo+IA0KPiA+ID4gRml4ZXM6IGJmOTI5MjcyNTFiMyAoIk1JUFM6IGJh
cnJpZXI6IEFkZCBfX1NZTkMoKSBpbmZyYXN0cnVjdHVyZSIpDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXJrIFRvbWxpbnNvbiA8bWFyay50b21saW5zb25AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4g
PiA+IC0tLQ0KPiA+ID4gIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeW5jLmggfCA0ICsrKy0NCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4g
PiANCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vc3luYy5oIGIvYXJj
aC9taXBzL2luY2x1ZGUvYXNtL3N5bmMuaA0KPiA+ID4gaW5kZXggN2M2YTEwOTVmNS4uYWFiZDA5
NzkzMyAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeW5jLmgNCj4g
PiA+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeW5jLmgNCj4gPiA+IEBAIC0xNTUsOSAr
MTU1LDExIEBADQo+ID4gPiAgICogZWZmZWN0aXZlIGJhcnJpZXIgYXMgbm90ZWQgYnkgY29tbWl0
IDZiMDdkMzhhYWE1MiAoIk1JUFM6IE9jdGVvbjogVXNlDQo+ID4gPiAgICogb3B0aW1pemVkIG1l
bW9yeSBiYXJyaWVyIHByaW1pdGl2ZXMuIikuIEhlcmUgd2Ugc3BlY2lmeSB0aGF0IHRoZSBhZmZl
Y3RlZA0KPiA+ID4gICAqIHN5bmMgaW5zdHJ1Y3Rpb25zIHNob3VsZCBiZSBlbWl0dGVkIHR3aWNl
Lg0KPiA+ID4gKyAqIE5vdGUgdGhhdCB0aGlzIGV4cHJlc3Npb24gaXMgZXZhbHVhdGVkIGJ5IHRo
ZSBhc3NlbWJsZXIgKG5vdCB0aGUgY29tcGlsZXIpLA0KPiA+ID4gKyAqIGFuZCB0aGF0IHRoZSBh
c3NlbWJsZXIgZXZhbHVhdGVzICc9PScgYXMgMCBvciAtMSwgbm90IDAgb3IgMS4NCj4gPiA+ICAg
Ki8NCj4gPiA+ICAjaWZkZWYgQ09ORklHX0NQVV9DQVZJVU1fT0NURU9ODQo+ID4gPiAtIyBkZWZp
bmUgX19TWU5DX3JwdCh0eXBlKSAgICAgICgxICsgKHR5cGUgPT0gX19TWU5DX3dtYikpDQo+ID4g
PiArIyBkZWZpbmUgX19TWU5DX3JwdCh0eXBlKSAgICAgICgxIC0gKHR5cGUgPT0gX19TWU5DX3dt
YikpDQo+ID4gPiAgI2Vsc2UNCj4gPiA+ICAjIGRlZmluZSBfX1NZTkNfcnB0KHR5cGUpICAgICAg
MQ0KPiA+ID4gICNlbmRpZg0KPiA+ID4gLS0NCj4gPiA+IDIuMjUuMA0KPiA+ID4gDQo+IA0KPiAN
Cg==
