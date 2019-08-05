Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6C0826A2
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 23:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbfHEVNc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 17:13:32 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51377 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730099AbfHEVNc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 17:13:32 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5241A886BF;
        Tue,  6 Aug 2019 09:13:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1565039610;
        bh=gr5g/LdhGiAPQskPWwPEPBEUEIgZSDqZJDL0N1Bmt60=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=2cLajRx2gMhwFVkOpKxHu6FHcGMPWjU90WVzNy+eTJ/gRUFP671Rys7zqdXd5m3S+
         d6taYtmKwCU2ktfQj/oL4BfOBdaxlBSwzgQZf/VG/pIPHo6doI/uKseYuJ52w+wHfD
         MW4ub7Dlo4lMw4wWmt/XMABcpXyu0qYTRIOnlLTw20dUIHPeCOlrW0UCzQiVEi69Js
         1AD/O0qRHsG3o4GcZS7Og/yyAuOgKC2JYp9IY5QY8ykB/OWihqHdz/HTIBYhBjBqC1
         7Rk9/DJZrWa/+aULCCcXXOa2zr83eymBjRn/NTUr22tx19aqu8Hh9fsxh9DNknWrZT
         YN7apu6E2jSwQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d489bf80003>; Tue, 06 Aug 2019 09:13:28 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Tue, 6 Aug 2019 09:13:29 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 6 Aug 2019 09:13:29 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "tjin@wavecomp.com" <tjin@wavecomp.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: MIPS Cache Coherency Issue
Thread-Topic: MIPS Cache Coherency Issue
Thread-Index: AQHVS5HXMgkNbD3nfE6pTHb9H7kbG6bsRPOA
Date:   Mon, 5 Aug 2019 21:13:29 +0000
Message-ID: <1565039609.15175.3.camel@alliedtelesis.co.nz>
References: <MWHPR2201MB1119058430642AC300B621ACB8DA0@MWHPR2201MB1119.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB1119058430642AC300B621ACB8DA0@MWHPR2201MB1119.namprd22.prod.outlook.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5900F38A54DBF1409DEF0E303A28D16C@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTA1IGF0IDE0OjAyICswMDAwLCBUb21teSBKaW4gd3JvdGU6DQo+IEhp
IENocmlzLA0KPiANCj4gTXkgbmFtZSBpcyBUb21teSwgZnJvbSB3YXZlIGNvbXB1dGluZyBDbyxM
dGQsIG91ciB0ZWFtIGlzIHdvcmtpbmcgb24NCj4gdGhlIG1haW50ZW5hbmNlIG9mIHRoZSBNSVBT
IGtlcm5lbC4NCj4gDQo+IFlvdSByYWlzZWQgYSBNSVBTIGNhY2hlIGNvaGVyZW5jeSBwYXRjaCB3
aGljaCBjYW4gYmUgZm91bmQgaW4gdGhlDQo+IGZvbGxvd2luZyBsaW5rcw0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1taXBzLzIwMTkwNTI4MjIxMjU1LjIyNDYwLTEtY2hyaXMucGFj
a2gNCj4gYW1AYWxsaWVkdGVsZXNpcy5jby5uei9ULyN1DQo+IA0KPiBXaXRoIFBhdWwncyBwYXRj
aCwgSXQgc2VlbXMgeW91IHN0aWxsIGdldCAib3RoZXIgYmFkIGJlaGF2aW91ciIsIGl0DQo+IGRv
ZXNuJ3Qgd29yayBmb3IgeW91LiBIYXMgdGhpcyBpc3N1ZSBiZWVuIHJlc29sdmVkP8KgDQoNCklu
IHNob3J0IG5vIGl0IGhhc24ndCBiZWVuIHJlc29sdmVkLiBJIGhhdmVuJ3QgYmVlbiBhYmxlIHRv
IHNwZW5kIG11Y2gNCnRpbWUgbG9va2luZyBhdCB0aGUgaXNzdWUocykgc28gSSBoYXZlbid0IGJl
ZW4gYWJsZSB0byB0ZWxsIGlmIFBhdWwncw0KcGF0Y2ggdW5jb3ZlcmVkIHByZS1leGlzdGluZyBp
c3N1ZXMgb3IgY2F1c2VkIG5ldyBvbmVzLg0KDQpVbmZvcnR1bmF0ZWx5IEkgcHJvYmFibHkgd29u
J3QgZ2V0IG9udG8gaXQgYW55IHRpbWUgc29vbi4gSSB3YXMgaG9waW5nDQp0byBnZXQgc29tZSBv
ZiBteSBvdGhlciB0ZWFtIG1lbWJlcnMgdG8gcGljayB1cCB0aGUgaXNzdWUgYnV0IHRoZXkncmUN
CmFsbCBidXN5IGFzIHdlbGwuDQo=
