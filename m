Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2FF262347
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 00:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgIHW6C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 18:58:02 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3091 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726608AbgIHW6B (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Sep 2020 18:58:01 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
        by Forcepoint Email with ESMTP id 5A90A2FEA013EBB99EA7;
        Wed,  9 Sep 2020 06:57:58 +0800 (CST)
Received: from dggemi760-chm.china.huawei.com (10.1.198.146) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 9 Sep 2020 06:57:57 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi760-chm.china.huawei.com (10.1.198.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 9 Sep 2020 06:57:57 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Wed, 9 Sep 2020 06:57:58 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Roman Gushchin <guro@fb.com>, Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Thread-Topic: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Thread-Index: AQHWgZ6q5kW1Gz5+A0q7Q/uhiyJlbalXnXHAgAb1HoCAAM7vIA==
Date:   Tue, 8 Sep 2020 22:57:57 +0000
Message-ID: <54ebebeb43aa4ac58e690a470559499b@hisilicon.com>
References: <20200903030204.253433-1-mike.kravetz@oracle.com>
 <6b4f0324c6db41a7975267f2ec42e577@hisilicon.com>
 <b2f18f10-5ccc-d3ea-c60b-5fd230a2b20a@oracle.com>
In-Reply-To: <b2f18f10-5ccc-d3ea-c60b-5fd230a2b20a@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.208]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWlrZSBLcmF2ZXR6IFtt
YWlsdG86bWlrZS5rcmF2ZXR6QG9yYWNsZS5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVt
YmVyIDksIDIwMjAgNjoyOSBBTQ0KPiBUbzogU29uZyBCYW8gSHVhIChCYXJyeSBTb25nKSA8c29u
Zy5iYW8uaHVhQGhpc2lsaWNvbi5jb20+Ow0KPiBsaW51eC1tbUBrdmFjay5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFJvbWFuIEd1c2hjaGluIDxn
dXJvQGZiLmNvbT47IEpvb25zb28gS2ltIDxqczEzMDRAZ21haWwuY29tPjsgUmlrDQo+IHZhbiBS
aWVsIDxyaWVsQHN1cnJpZWwuY29tPjsgQXNsYW4gQmFraXJvdiA8YXNsYW5AZmIuY29tPjsgTWlj
aGFsIEhvY2tvDQo+IDxtaG9ja29Aa2VybmVsLm9yZz47IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIXSBjbWE6IG1ha2Ug
bnVtYmVyIG9mIENNQSBhcmVhcyBkeW5hbWljLCByZW1vdmUNCj4gQ09ORklHX0NNQV9BUkVBUw0K
PiANCj4gT24gOS8zLzIwIDY6NTggUE0sIFNvbmcgQmFvIEh1YSAoQmFycnkgU29uZykgd3JvdGU6
DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogTWlrZSBL
cmF2ZXR6IFttYWlsdG86bWlrZS5rcmF2ZXR6QG9yYWNsZS5jb21dDQo+ID4+IFNlbnQ6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgMywgMjAyMCAzOjAyIFBNDQo+ID4+IFRvOiBsaW51eC1tbUBrdmFjay5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6
IFJvbWFuIEd1c2hjaGluIDxndXJvQGZiLmNvbT47IFNvbmcgQmFvIEh1YSAoQmFycnkgU29uZykN
Cj4gPj4gPHNvbmcuYmFvLmh1YUBoaXNpbGljb24uY29tPjsgSm9vbnNvbyBLaW0gPGpzMTMwNEBn
bWFpbC5jb20+OyBSaWsgdmFuDQo+ID4+IFJpZWwgPHJpZWxAc3VycmllbC5jb20+OyBBc2xhbiBC
YWtpcm92IDxhc2xhbkBmYi5jb20+OyBNaWNoYWwgSG9ja28NCj4gPj4gPG1ob2Nrb0BrZXJuZWwu
b3JnPjsgQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz47DQo+IE1pa2UN
Cj4gPj4gS3JhdmV0eiA8bWlrZS5rcmF2ZXR6QG9yYWNsZS5jb20+DQo+ID4+IFN1YmplY3Q6IFtS
RkMgUEFUQ0hdIGNtYTogbWFrZSBudW1iZXIgb2YgQ01BIGFyZWFzIGR5bmFtaWMsIHJlbW92ZQ0K
PiA+PiBDT05GSUdfQ01BX0FSRUFTDQo+ID4+DQo+ID4+IFRoZSBudW1iZXIgb2YgZGlzdGluY3Qg
Q01BIGFyZWFzIGlzIGxpbWl0ZWQgYnkgdGhlIGNvbnN0YW50DQo+ID4+IENPTkZJR19DTUFfQVJF
QVMuICBJbiBtb3N0IGVudmlyb25tZW50cywgdGhpcyB3YXMgc2V0IHRvIGEgZGVmYXVsdA0KPiA+
PiB2YWx1ZSBvZiA3LiAgTm90IHRvbyBsb25nIGFnbywgc3VwcG9ydCB3YXMgYWRkZWQgdG8gYWxs
b2NhdGUgaHVnZXRsYg0KPiA+PiBnaWdhbnRpYyBwYWdlcyBmcm9tIENNQS4gIE1vcmUgcmVjZW50
IGNoYW5nZXMgdG8gbWFrZQ0KPiBkbWFfYWxsb2NfY29oZXJlbnQNCj4gPj4gTlVNQS1hd2FyZSBv
biBhcm02NCBhZGRlZCBtb3JlIHBvdGVudGlhbCB1c2VycyBvZiBDTUEgYXJlYXMuICBBbG9uZw0K
PiA+PiB3aXRoIHRoZSBkbWFfYWxsb2NfY29oZXJlbnQgY2hhbmdlcywgdGhlIGRlZmF1bHQgdmFs
dWUgb2YgQ01BX0FSRUFTDQo+ID4+IHdhcyBidW1wZWQgdXAgdG8gMTkgaWYgTlVNQSBpcyBlbmFi
bGVkLg0KPiA+Pg0KPiA+PiBJdCBzZWVtcyB0aGF0IHRoZSBudW1iZXIgb2YgQ01BIHVzZXJzIGlz
IGxpa2VseSB0byBncm93LiAgSW5zdGVhZCBvZg0KPiA+PiB1c2luZyBhIHN0YXRpYyBhcnJheSBm
b3IgY21hIGFyZWFzLCB1c2UgYSBzaW1wbGUgbGlua2VkIGxpc3QuICBUaGVzZQ0KPiA+PiBhcmVh
cyBhcmUgdXNlZCBiZWZvcmUgbm9ybWFsIG1lbW9yeSBhbGxvY2F0b3JzLCBzbyB1c2UgdGhlIG1l
bWJsb2NrDQo+ID4+IGFsbG9jYXRvci4NCj4gPg0KPiA+IEhlbGxvIE1pa2UsIEl0IHNlZW1zIGl0
IGlzIGEgZ29vZCBpZGVhLiBUaGFua3MgZm9yIGFkZHJlc3NpbmcgdGhpcy4NCj4gPg0KPiA+IEkg
d2FzIGZvY3VzaW5nIG9uIHBlci1udW1hIGNtYSBmZWF0dXJlIGluIG15IHBhdGNoc2V0IGFuZCBJ
IGRpZG4ndCB0YWtlIGNhcmUNCj4gb2YgdGhpcw0KPiA+IHdoaWxlIEkgdGhvdWdodCB3ZSBzaG91
bGQgZG8gc29tZXRoaW5nIGZvciB0aGUgbnVtYmVyIG9mIGNtYSBhcmVhcy4NCj4gPg0KPiANCj4g
VGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLg0KPiANCj4gT25lIGFyZWEgd2hlcmUgSSBjb3VsZCB1
c2Ugc29tZSBoZWxwIGlzIHRlc3RpbmcvdmVyaWZ5aW5nIG9uIGFybS4gIFNlZSB0aGUNCj4gY2hh
bmdlcyB0byBhcmNoL2FybS9tbS9kbWEtbWFwcGluZy5jLiAgSSBoYXZlIHRlc3RlZCB0aGUgZ2Vu
ZXJpYyBjaGFuZ2VzDQo+IG9uDQo+IG15IHg4NiBwbGF0Zm9ybSwgYnV0IGRvIG5vdCBoYXZlIGFu
IGFybSBwbGF0Zm9ybSBmb3IgZWFzeSB0ZXN0aW5nLg0KPiANCj4gPj4gIHZvaWQgX19pbml0IGRt
YV9jb250aWd1b3VzX2Vhcmx5X2ZpeHVwKHBoeXNfYWRkcl90IGJhc2UsIHVuc2lnbmVkIGxvbmcN
Cj4gPj4gc2l6ZSkNCj4gPj4gIHsNCj4gPj4gLQlkbWFfbW11X3JlbWFwW2RtYV9tbXVfcmVtYXBf
bnVtXS5iYXNlID0gYmFzZTsNCj4gPj4gLQlkbWFfbW11X3JlbWFwW2RtYV9tbXVfcmVtYXBfbnVt
XS5zaXplID0gc2l6ZTsNCj4gPj4gLQlkbWFfbW11X3JlbWFwX251bSsrOw0KPiA+PiArCXN0cnVj
dCBkbWFfY29udGlnX2Vhcmx5X3Jlc2VydmUgKmQ7DQo+ID4+ICsNCj4gPj4gKwlkID0gbWVtYmxv
Y2tfYWxsb2Moc2l6ZW9mKHN0cnVjdCBkbWFfY29udGlnX2Vhcmx5X3Jlc2VydmUpLA0KPiA+DQo+
ID4gc2l6ZW9mKCpkKT8NCj4gDQo+IFllcy4gIHRoYW5rcy4NCj4gDQo+ID4+IEBAIC0xNzIsMTUg
KzE3MywxNCBAQCBpbnQgX19pbml0IGNtYV9pbml0X3Jlc2VydmVkX21lbShwaHlzX2FkZHJfdA0K
PiA+PiBiYXNlLCBwaHlzX2FkZHJfdCBzaXplLA0KPiA+PiAgCXN0cnVjdCBjbWEgKmNtYTsNCj4g
Pj4gIAlwaHlzX2FkZHJfdCBhbGlnbm1lbnQ7DQo+ID4+DQo+ID4+IC0JLyogU2FuaXR5IGNoZWNr
cyAqLw0KPiA+PiAtCWlmIChjbWFfYXJlYV9jb3VudCA9PSBBUlJBWV9TSVpFKGNtYV9hcmVhcykp
IHsNCj4gPj4gLQkJcHJfZXJyKCJOb3QgZW5vdWdoIHNsb3RzIGZvciBDTUEgcmVzZXJ2ZWQgcmVn
aW9ucyFcbiIpOw0KPiA+PiAtCQlyZXR1cm4gLUVOT1NQQzsNCj4gPj4gLQl9DQo+ID4+ICsJLyog
RG8gbm90IGF0dGVtcHQgYWxsb2NhdGlvbnMgYWZ0ZXIgbWVtYmxvY2sgYWxsb2NhdG9yIGlzIHRv
cm4gZG93biAqLw0KPiA+PiArCWlmIChzbGFiX2lzX2F2YWlsYWJsZSgpKQ0KPiA+PiArCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPj4NCj4gPj4gIAlpZiAoIXNpemUgfHwgIW1lbWJsb2NrX2lzX3JlZ2lv
bl9yZXNlcnZlZChiYXNlLCBzaXplKSkNCj4gPj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4+DQo+
ID4+ICsNCj4gPg0KPiA+IElzIHRoaXMgZW1wdHkgbGluZSByZWxldmFudD8NCj4gDQo+IE5vLCBh
ZGRlZCBieSBtaXN0YWtlLg0KPiANCj4gPj4gQEAgLTE5MiwxMiArMTkyLDE3IEBAIGludCBfX2lu
aXQgY21hX2luaXRfcmVzZXJ2ZWRfbWVtKHBoeXNfYWRkcl90DQo+ID4+IGJhc2UsIHBoeXNfYWRk
cl90IHNpemUsDQo+ID4+ICAJaWYgKEFMSUdOKGJhc2UsIGFsaWdubWVudCkgIT0gYmFzZSB8fCBB
TElHTihzaXplLCBhbGlnbm1lbnQpICE9IHNpemUpDQo+ID4+ICAJCXJldHVybiAtRUlOVkFMOw0K
PiA+Pg0KPiA+PiArCWNtYSA9IG1lbWJsb2NrX2FsbG9jKHNpemVvZihzdHJ1Y3QgY21hKSwgc2l6
ZW9mKGxvbmcpKTsNCj4gPg0KPiA+IHNpemVvZigqY21hKT8NCj4gDQo+IFllcywgdGhhbmtzLg0K
PiANCj4gPiBJdCBzZWVtcyB3ZSBhcmUgZ29pbmcgdG8gd3JpdGUgY21hLT4gY291bnQsIG9yZGVy
X3Blcl9iaXQsIGRlYnVnZnMgZmllbGRzLg0KPiA+IFRvIGF2b2lkIGZhbHNlIHNoYXJpbmcgb2Yg
dGhlIGNhY2hlbGluZSBvZiBzdHJ1Y3QgY21hLCBpdCBpcyBiZXR0ZXIgdG8gYWxpZ24gd2l0aA0K
PiA+IFNNUF9DQUNIRV9CWVRFUy4NCj4gPg0KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBpdCBzZWVt
cyB3ZSBhcmUgdW5saWtlbHkgdG8gd3JpdGUgdGhlIGNtYQ0KPiANCj4gSSB0aG91Z2h0IGFib3V0
IHVzaW5nIFNNUF9DQUNIRV9CWVRFUywgYnV0IHRoZSBzdHJ1Y3R1cmVzIGFyZSBzaW1wbHkNCj4g
ZGVmaW5lZA0KPiBhcyBhbiBhcnJheSB0b2RheS4gIFRoaXMgc2hvdWxkIG5vdCBiZSBhbnkgd29y
c2UuICBJIGRvIG5vdCBiZWxpZXZlIGFjY2Vzcw0KPiB0byB0aGUgc3RydWN0dXJlcyBpcyBwZXJm
b3JtYW5jZSBzZW5zaXRpdmUuDQoNClRoYXQgZGVwZW5kcyBvbiBob3cgb2Z0ZW4gcGVvcGxlIHdp
bGwgd3JpdGUgYW5kIHJlYWQgdGhlIGNtYSBzdHJ1Y3R1cmUgaW5kaXJlY3RseSB2aWENCmRtYV9h
bGxvYy9mcmVlX2NvaGVyZW50KCkgQVBJcywgZXNwZWNpYWxseSB0aHJvdWdoIG11bHRpcGxlIENQ
VXMuDQpBbnl3YXksIHdlIGRvbid0IGhhdmUgYmVuY2htYXJrIGRhdGEgdG8gY2hlY2sgaWYgdGhp
cyB3aWxsIGJlIHJlYWxseSBhIHByb2JsZW0uDQpTbyBJIGFtIG9rIHdpdGggdGhlIGNvZGUgd2Ug
dXNlIGVpdGhlciBTTVBfQ0FDSEVfQllURVMgb3IgbG9uZyBhcyB0aGUgYWxpZ25tZW50Lg0KDQo+
IA0KPiBUaGFua3MsDQo+IC0tDQo+IE1pa2UgS3JhdmV0eg0KDQpUaGFua3MNCkJhcnJ5DQo=
