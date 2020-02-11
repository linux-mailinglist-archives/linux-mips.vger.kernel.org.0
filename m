Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D5B159B3F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 22:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgBKViD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 16:38:03 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38236 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbgBKViD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 16:38:03 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2796683645;
        Wed, 12 Feb 2020 10:38:00 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581457080;
        bh=BWZ3XnsKQFnPu8ywhW1/XL2Lfk2SJOoZsOxmckSWviw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=LTR0BrkYbqoqfzr1pZ/Ce9YtZHhnc994WINaM8XjablsOtIDc8RikSeujSJrowEu8
         Mwg0zI0n4IJOCRYIKHHljwA7qhl3fAuzuONam9DNHrdr8y+e8nY+izJw7lOajIbc9K
         +U6QPRnmEvCwkDEKSf8MLOfhktxFppIv1WBIQPJThy6a14ne3m1yee0OEG6tssVqtc
         SrG/AJfVuxDNIkZXX6gSYlS3YKhInGWve/NW39vOwGqRGStJ/Ai/hbqoIXbrgnIcJD
         gMC1j+xQvuiL+mtxMl4nAQU+ZC4zK6MGnwXrnAMeII07H8wzirhPeTn94CQifc8A7N
         KkUzK9UK99D9Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e431eb80001>; Wed, 12 Feb 2020 10:38:00 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb 2020 10:38:00 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1473.005; Wed, 12 Feb 2020 10:38:00 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Thread-Topic: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Thread-Index: AQHV4SHSo52AlyiF50aUibwtU28qqagVqt2A
Date:   Tue, 11 Feb 2020 21:37:59 +0000
Message-ID: <6fc1ab12ed330ffb35d4eb100e3b35c91d3d2d18.camel@alliedtelesis.co.nz>
References: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
In-Reply-To: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:816b:1e68:7f19:f27f]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A45D7E6472A10F4180B5FD19C77AB0D5@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gV2VkLCAyMDIwLTAyLTEyIGF0IDEwOjI0ICsxMzAwLCBNYXJrIFRvbWxpbnNvbiB3cm90ZToN
Cj4gVGhlIENhdml1bSBPY3Rlb24gQ1BVIHVzZXMgYSBzcGVjaWFsIHN5bmMgaW5zdHJ1Y3Rpb24g
Zm9yIGltcGxlbWVudGluZw0KPiB3bWIsIGFuZCBkdWUgdG8gYSBDUFUgYnVnLCB0aGUgaW5zdHJ1
Y3Rpb24gbXVzdCBhcHBlYXIgdHdpY2UuIEEgbWFjcm8NCj4gaGFkIGJlZW4gZGVmaW5lZCB0byBo
aWRlIHRoaXM6DQo+IA0KPiAgI2RlZmluZSBfX1NZTkNfcnB0KHR5cGUpICAgICAoMSArICh0eXBl
ID09IF9fU1lOQ193bWIpKQ0KPiANCj4gd2hpY2ggd2FzIGludGVuZGVkIHRvIGV2YWx1YXRlIHRv
IDIgZm9yIF9fU1lOQ193bWIsIGFuZCAxIGZvciBhbnkgb3RoZXINCj4gdHlwZSBvZiBzeW5jLiBI
b3dldmVyLCB0aGlzIGV4cHJlc3Npb24gaXMgZXZhbHVhdGVkIGJ5IHRoZSBhc3NlbWJsZXIsDQo+
IGFuZCBub3QgdGhlIGNvbXBpbGVyLCBhbmQgdGhlIHJlc3VsdCBvZiAnPT0nIGluIHRoZSBhc3Nl
bWJsZXIgaXMgMCBvcg0KPiAtMSwgbm90IDAgb3IgMSBhcyBpdCBpcyBpbiBDLiBUaGUgbmV0IHJl
c3VsdCB3YXMgd21iKCkgcHJvZHVjaW5nIG5vIGNvZGUNCj4gYXQgYWxsLiBUaGUgc2ltcGxlIGZp
eCBpbiB0aGlzIHBhdGNoIGlzIHRvIGNoYW5nZSB0aGUgJysnIHRvICctJy4NCj4gDQo+IEZpeGVz
OiBiZjkyOTI3MjUxYjMgKCJNSVBTOiBiYXJyaWVyOiBBZGQgX19TWU5DKCkgaW5mcmFzdHJ1Y3R1
cmUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFRvbWxpbnNvbiA8bWFyay50b21saW5zb25AYWxs
aWVkdGVsZXNpcy5jby5uej4NCg0KRm9yIHdoYXQgaXQncyB3b3J0aA0KDQpUZXN0ZWQtYnk6IENo
cmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCg0KPiAtLS0N
Cj4gIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeW5jLmggfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL21pcHMvaW5jbHVkZS9hc20vc3luYy5oIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3N5bmMu
aA0KPiBpbmRleCA3YzZhMTA5NWY1Li5hYWJkMDk3OTMzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL21p
cHMvaW5jbHVkZS9hc20vc3luYy5oDQo+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeW5j
LmgNCj4gQEAgLTE1NSw5ICsxNTUsMTEgQEANCj4gICAqIGVmZmVjdGl2ZSBiYXJyaWVyIGFzIG5v
dGVkIGJ5IGNvbW1pdCA2YjA3ZDM4YWFhNTIgKCJNSVBTOiBPY3Rlb246IFVzZQ0KPiAgICogb3B0
aW1pemVkIG1lbW9yeSBiYXJyaWVyIHByaW1pdGl2ZXMuIikuIEhlcmUgd2Ugc3BlY2lmeSB0aGF0
IHRoZSBhZmZlY3RlZA0KPiAgICogc3luYyBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIGVtaXR0ZWQg
dHdpY2UuDQo+ICsgKiBOb3RlIHRoYXQgdGhpcyBleHByZXNzaW9uIGlzIGV2YWx1YXRlZCBieSB0
aGUgYXNzZW1ibGVyIChub3QgdGhlIGNvbXBpbGVyKSwNCj4gKyAqIGFuZCB0aGF0IHRoZSBhc3Nl
bWJsZXIgZXZhbHVhdGVzICc9PScgYXMgMCBvciAtMSwgbm90IDAgb3IgMS4NCj4gICAqLw0KPiAg
I2lmZGVmIENPTkZJR19DUFVfQ0FWSVVNX09DVEVPTg0KPiAtIyBkZWZpbmUgX19TWU5DX3JwdCh0
eXBlKQkoMSArICh0eXBlID09IF9fU1lOQ193bWIpKQ0KPiArIyBkZWZpbmUgX19TWU5DX3JwdCh0
eXBlKQkoMSAtICh0eXBlID09IF9fU1lOQ193bWIpKQ0KPiAgI2Vsc2UNCj4gICMgZGVmaW5lIF9f
U1lOQ19ycHQodHlwZSkJMQ0KPiAgI2VuZGlmDQo=
