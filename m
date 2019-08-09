Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCEB2870A9
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2019 06:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfHIE0c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Aug 2019 00:26:32 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:59951 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfHIE0c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Aug 2019 00:26:32 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2932F886BF;
        Fri,  9 Aug 2019 16:26:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1565324789;
        bh=vp1EdohliELZRdj/pZ81MK3+sm0w7e9cUDoa1g4+tY8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=BjwNLHyqeITEWX1D+t/R9TJNM5NVL/sJg8MvAV1g2KxPIxyRe2AkGogwVR+CxKOov
         kAoHoh2xfhsv3SxtiRciD3n8PXxbvbqh5eLej7AMjsO7HIlZJ/atDXUXR17I+81NKG
         IpYLIEgp4D2dsjEBI4VNUJJf0kjZtIh7niIJe32RHKdbZpi3ssz/gQPeuyIhzqP72W
         /Nchc67xrlp+OGTMTcng4ZMv6vjjiwyyxVLkOD5kXnuaq+Wj29BIhbyLDy6mUcsOOL
         MiVHjGSnHNUT0rdp5gTB+LHfdZaeqg05LpLXP8EOTL7vsr8ukM4r886LXbdV72dElZ
         JoxH0tmpP3r/w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d4cf5f50001>; Fri, 09 Aug 2019 16:26:29 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Fri, 9 Aug 2019 16:26:28 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 9 Aug 2019 16:26:28 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "tjin@wavecomp.com" <tjin@wavecomp.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [EXTERNAL]Re: MIPS Cache Coherency Issue
Thread-Topic: [EXTERNAL]Re: MIPS Cache Coherency Issue
Thread-Index: AQHVS5HXMgkNbD3nfE6pTHb9H7kbG6bsRPOAgAEPJ3+ABCDRAA==
Date:   Fri, 9 Aug 2019 04:26:28 +0000
Message-ID: <1565324788.4267.36.camel@alliedtelesis.co.nz>
References: <MWHPR2201MB1119058430642AC300B621ACB8DA0@MWHPR2201MB1119.namprd22.prod.outlook.com>
        ,<1565039609.15175.3.camel@alliedtelesis.co.nz>
         <MWHPR2201MB1119ECD5E55C8E1A9CFD3942B8D50@MWHPR2201MB1119.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB1119ECD5E55C8E1A9CFD3942B8D50@MWHPR2201MB1119.namprd22.prod.outlook.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F1D6CC8647BB94CB3796006D3FB6A06@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVHVlLCAyMDE5LTA4LTA2IGF0IDAxOjQzICswMDAwLCBUb21teSBKaW4gd3JvdGU6DQo+IEhp
IENocmlzLA0KPiANCj4gSWYgeW91J3JlIGJ1c3kgd2l0aCBvdGhlciB0aGluZ3MsIG1heWJlIEkg
Y2FuIGdpdmUgeW91IGEgaGFuZCwgc28gaG93DQo+IGNhbiBJIHJlcGxpY2F0ZSB0aGlzIGlzc3Vl
IGxvY2FsbHk/DQoNClRoYW5rcyBmb3IgdGhlIG9mZmVyIGJ1dCBJJ20gbm90IHN1cmUgeW91J2xs
IGJlIGFibGUgdG8gZG8gbXVjaCB3aXRob3V0DQpvdXIgc3BlY2lmaWMgaGFyZHdhcmUuDQoNCj4g
DQo+IEZyb20geW91ciBsb2csIEkgY2FuIGdldCB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uLCBw
bGVhc2UgY29ycmVjdCBtZQ0KPiBpZiBJIG1pc3MgYW55dGhpbmcuDQo+IGtlcm5lbCB2ZXJzaW9u
OiA1LjEuMA0KDQpUaGF0J3Mgd2hhdCBJIHdhcyB1c2luZyBhdCB0aGUgdGltZS4gSSBpbWFnaW5l
IDUuMiBvciA1LjMgd291bGQgYmVoYXZlDQp0aGUgc2FtZS4NCg0KPiBoYXJkd2FyZSBwbGF0Zm9y
bTogYnJvYWRjb20gQk1JUFM0MzUwDQoNClRoZSBzcGVjaWZpYyBTb0MgaXPCoEJDTTY4MThHUiB3
aGljaCBJIGJlbGlldmUgaXMgdGhlIHNhbWUgY29yZSBhcyB0aGUNCkJNSVBTNDM1NS4NCg0KPiBJ
IHByb2JhYmx5IGNvdWxkbid0IGdldCBhIGJyb2FkY29tIEJNSVBTNDM1MCwgaXMgdGhlcmUgYW55
IHNpbXVsYXRvcg0KPiBmb3IgdGhpcyBib2FyZChlLmcuIFFFTVUpPw0KDQpZZWFoIGl0J3MgYSBw
cmV0dHkgb2xkIGNoaXAuIEknbSBub3QgYXdhcmUgb2YgYW55IFFFTVUgc3VwcG9ydCwgYnV0IEkN
CmhhdmVuJ3QgbG9va2VkLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbW15DQo+IEZyb206
IGxpbnV4LW1pcHMtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1taXBzLW93bmVyQHZnZXIu
a2VybmVsLg0KPiBvcmc+IG9uIGJlaGFsZiBvZiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFt
QGFsbGllZHRlbGVzaXMuY28ubno+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCA2LCAyMDE5IDU6
MTMgQU0NCj4gVG86IFRvbW15IEppbiA8dGppbkB3YXZlY29tcC5jb20+DQo+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgbGlu
dQ0KPiB4LW1pcHNAdmdlci5rZXJuZWwub3JnIDxsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZz4N
Cj4gU3ViamVjdDogW0VYVEVSTkFMXVJlOiBNSVBTIENhY2hlIENvaGVyZW5jeSBJc3N1ZQ0KPiDC
oA0KPiBPbiBNb24sIDIwMTktMDgtMDUgYXQgMTQ6MDIgKzAwMDAsIFRvbW15IEppbiB3cm90ZToN
Cj4gPiBIaSBDaHJpcywNCj4gPsKgDQo+ID4gTXkgbmFtZSBpcyBUb21teSwgZnJvbSB3YXZlIGNv
bXB1dGluZyBDbyxMdGQsIG91ciB0ZWFtIGlzIHdvcmtpbmcNCj4gb24NCj4gPiB0aGUgbWFpbnRl
bmFuY2Ugb2YgdGhlIE1JUFMga2VybmVsLg0KPiA+wqANCj4gPiBZb3UgcmFpc2VkIGEgTUlQUyBj
YWNoZSBjb2hlcmVuY3kgcGF0Y2ggd2hpY2ggY2FuIGJlIGZvdW5kIGluIHRoZQ0KPiA+IGZvbGxv
d2luZyBsaW5rcw0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1pcHMvMjAxOTA1
MjgyMjEyNTUuMjI0NjAtMS1jaHJpcy5wYWMNCj4ga2gNCj4gPiBhbUBhbGxpZWR0ZWxlc2lzLmNv
Lm56L1QvI3UNCj4gPsKgDQo+ID4gV2l0aCBQYXVsJ3MgcGF0Y2gsIEl0IHNlZW1zIHlvdSBzdGls
bCBnZXQgIm90aGVyIGJhZCBiZWhhdmlvdXIiLCBpdA0KPiA+IGRvZXNuJ3Qgd29yayBmb3IgeW91
LiBIYXMgdGhpcyBpc3N1ZSBiZWVuIHJlc29sdmVkP8KgDQo+IA0KPiBJbiBzaG9ydCBubyBpdCBo
YXNuJ3QgYmVlbiByZXNvbHZlZC4gSSBoYXZlbid0IGJlZW4gYWJsZSB0byBzcGVuZA0KPiBtdWNo
DQo+IHRpbWUgbG9va2luZyBhdCB0aGUgaXNzdWUocykgc28gSSBoYXZlbid0IGJlZW4gYWJsZSB0
byB0ZWxsIGlmIFBhdWwncw0KPiBwYXRjaCB1bmNvdmVyZWQgcHJlLWV4aXN0aW5nIGlzc3VlcyBv
ciBjYXVzZWQgbmV3IG9uZXMuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IEkgcHJvYmFibHkgd29uJ3Qg
Z2V0IG9udG8gaXQgYW55IHRpbWUgc29vbi4gSSB3YXMNCj4gaG9waW5nDQo+IHRvIGdldCBzb21l
IG9mIG15IG90aGVyIHRlYW0gbWVtYmVycyB0byBwaWNrIHVwIHRoZSBpc3N1ZSBidXQgdGhleSdy
ZQ0KPiBhbGwgYnVzeSBhcyB3ZWxsLg==
