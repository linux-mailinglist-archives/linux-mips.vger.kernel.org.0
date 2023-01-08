Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0450D66199E
	for <lists+linux-mips@lfdr.de>; Sun,  8 Jan 2023 22:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjAHVAE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Jan 2023 16:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjAHVAE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Jan 2023 16:00:04 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0B5A191
        for <linux-mips@vger.kernel.org>; Sun,  8 Jan 2023 13:00:02 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A81562C0615
        for <linux-mips@vger.kernel.org>; Mon,  9 Jan 2023 09:59:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1673211596;
        bh=jrfxNS8VspGoGBSTYozHKmy1GnYg3SxA3OZHjTHGl4g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WonOTXZctk16hZ/Tswz3MLeCjQ0ZxSC3snrBAav7U+CMiaHfEeusrJA750FTj6Ndi
         lpT8ZbzW6YfDgZzPgkatq1/efmsU9O9O/6pa2iQHQi1YNRABL85rrb7vcl8nbUqjUm
         y9V1CJZhRy33uKooXYNUmurvhyg6KEqttzntxblat8bIeoinBhzvMK4KMOG+G243KF
         iT6DHgo4sOuKOHq077lihTfuaDYPg4Tzw0RMQ3b2kv/rfEPv5zZ3dYAp0uGATYnJbi
         CeMi8Kg3zZpNwsIhPwyWMDeuPR87tyGEAVBd69rfkviMzQ4tBpw9/gaQwFb3ITBfs+
         31JiG4pBaK4Wg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B63bb2ecc0001>; Mon, 09 Jan 2023 09:59:56 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 09:59:56 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.044; Mon, 9 Jan 2023 09:59:56 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Ladislav Michl <oss-lists@triops.cz>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        YunQiang Su <wzssyqa@gmail.com>,
        Anushka Singh <anushka.singh1@wipro.com>,
        Lukasz Majczak <lma@semihalf.com>,
        Peter Swain <peter.swain@marvell.com>
Subject: Re: Moving Octeon ethernet out of staging
Thread-Topic: Moving Octeon ethernet out of staging
Thread-Index: AQHZGfM7cvdCvkwCqUezP7qJBIeInq6UOn2A
Date:   Sun, 8 Jan 2023 20:59:55 +0000
Message-ID: <520df165-305c-2e18-568c-dfbfc1ce1a26@alliedtelesis.co.nz>
References: <Y6rsbaT0l5cNBGbu@lenoch>
In-Reply-To: <Y6rsbaT0l5cNBGbu@lenoch>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <98A3D469FCDF4C439FC92F877AAF0856@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=X/cs11be c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=RvmDmJFTN0MA:10 a=62ntRvTiAAAA:8 a=VwQbUJbxAAAA:8 a=CX02uB0dcGOkma7K7mQA:9 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgTGFkaXMsDQoNCk9uIDI4LzEyLzIyIDAyOjAwLCBMYWRpc2xhdiBNaWNobCB3cm90ZToNCj4g
SGkgdGhlcmUsDQo+DQo+IE9jdGVvbiBldGhlcm5ldCBkcml2ZXJzIHdlcmUgb25jZSBraWNrZWQg
b3V0IG9mIHN0YWdpbmcsIGp1c3QgdG8gYmUNCj4gcmV0dXJuZWQgYmFjayBhIHdoaWxlIGFmdGVy
Og0KPiBodHRwczovL3NjYW5tYWlsLnRydXN0d2F2ZS5jb20vP2M9MjA5ODgmZD1fZXlxNHdiX0Nm
OEEyN01qeWxGVV9nWnBMTUVFdFpPbXdabS1scVQwUlEmdT1odHRwcyUzYSUyZiUyZmxvcmUlMmVr
ZXJuZWwlMmVvcmclMmZsa21sJTJmMjAyMDAyMDUwMDExMTYlMmUxNDA5Ni0xLWNocmlzJTJlcGFj
a2hhbSU0MGFsbGllZHRlbGVzaXMlMmVjbyUyZW56JTJmDQo+DQo+IEFsbCB0aGF0IHBhdGNoc2V0
IGVuZHMgd2l0aCBhbiBvcHRpbWlzdGljIGNvbW1lbnQ6DQo+IE9uIFdlZCwgMjAyMC0wMy0wNCBD
aHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gSSBoYXZlIGhhZCBhIHJlcGx5IGZyb20gTWFydmVsbC4g
VGhleSd2ZSBjb250cmFjdGVkIHN1cHBvcnQgZm9yIHRoZSBvbGQNCj4+IENhdml1bSBPY3Rlb24g
ZGVzaWducyBvdXQgdG8gYW4gZXh0ZXJuYWwgY29tcGFueS4gSSdtIG5vdCBzdXJlIHRoYXQNCj4+
IG1lYW5zIHRoYXQgd2UnbGwgc2VlIHNvbWUgYWN0aW9uIG9uIHRoZXNlIGRyaXZlcnMgYW55IHRp
bWUgc29vbiBidXQgYXQNCj4+IGxlYXN0IHRoZXkncmUgZG9pbmcgc29tZXRoaW5nLg0KPiBOb3cg
YmFzZWQgb24gTWFydmVsbCdzIDI3NyBwYXRjaGVzIGxvbmcgc2V0IGFnYWluc3QgNS40LjMwIGl0
IHNlZW1zIHRoYXQNCj4gJ2FuIGV4dGVybmFsIGNvbXBhbnknIGlzIFdpcHJvIGFuZCAnZG9pbmcg
c29tZXRoaW5nJyBpcyB0aGUgZXhhY3Qgb3Bwb3NpdGUNCj4gdG8gJ21ha2UgZHJpdmVyIHNlbGYt
Y29udGFpbmVkJyBhcyBkZXNjcmliZWQgaW4gZHJpdmVycy9zdGFnaW5nL29jdGVvbi9UT0RPDQo+
DQo+IFRoYXQgcGF0Y2hzZXQgY29udGFpbnMgZG96ZW4gb2YgKlN5bmMtdXAtU0UqIHBhdGNoZXMg
d2hpY2ggYmFzaWNhbGx5IGR1bXBzDQo+IG1haW5saW5lIGNoYW5nZXMgYW5kIHJlcGxhY2VzIHBs
YXRmb3JtIGZpbGVzIHdpdGggdGhlIEJTRCBsaWNlbnNlZCBvbmVzDQo+IGNvbW1vbiBmb3IgTGlu
dXgsIFUtQm9vdCBhbmQgQ2F2aXVtIHRvb2xzLiBFdGhlcm5ldCBkcml2ZXIgaXMgdGhlbiBzeW5j
ZWQNCj4gdG8gdGhhdCBjaGFuZ2VzLCBtYWtpbmcgaXQgZXZlbiBtb3JlIGRlcGVuZGVudCBvbiBh
cmNoL21pcHMvY2F2aXVtLW9jdGVvbg0KPiBjb2RlLg0KPg0KPiBUbyBmaXggc3RhZ2luZyBkcml2
ZXIgdG8gd29yayB3aXRoIGN1c3RvbWVyJ3MgQ043MDIwIGJhc2VkIGJvYXJkIEknZCBoYWQgdG8N
Cj4gZWl0aGVyIGdvIE1hcnZlbGwncyBkaXJlY3Rpb24gb3IgdXNlIERUIGZvciBkcml2ZXIgY29u
ZmlndXJhdGlvbiwgc28gSQ0KPiBwYXJ0aWFsbHkgZGlkIHRoZSBsYXR0ZXIuIEl0IGlzIHByb2Jh
Ymx5IGJyb2tlbiBmb3IgYW55dGhpbmcgZWxzZSB0aGFuDQo+IENONzBYWCBhbmQgaXQgYnJlYWtz
IHRoZSBBQkksIG5ld2VyIGtlcm5lbCB3aWxsIG5vdCB3b3JrIHdpdGggb2xkZXINCj4gYmluZGlu
Z3MuIElzIHRoYXQgb2theSBmb3Igc3RhZ2luZyBkcml2ZXJzPyBEb2VzIGFueW9uZSBldmVuIGlu
dGVuZCB0bw0KPiB1c2UgbWFpbmxpbmUga2VybmVsIHdpdGggT2N0ZW9uIFNvQ3M/IE9mIGNvdXJz
ZSBJJ2QgYmUgaGFwcHkgaGVhcmluZw0KPiBzb21ldGhpbmcgY2hhbmdlZCBhdCBNYXJ2ZWxsIGFu
ZCB0aGV5IGFyZSB3aWxsaW5nIHRvIG1haW5saW5lIHN1cHBvcnQNCj4gZm9yIHRoZWlyIE1JUFMg
YmFzZWQgU29DcyA7LSkNCg0KIEZyb20gb3VyIGVuZCB3ZSBzdGlsbCBoYXZlIG91ciBPY3Rlb24g
TUlQUyBiYXNlZCByb3V0ZXJzIHdoaWNoIHdlIHN0aWxsIA0Kd2FudCB0byBzdXBwb3J0IGJ1dCBm
b3IgdmFyaW91cyByZWFzb25zIHRoZXNlIGFyZW4ndCBzZWVpbmcgdGhlIGtlcm5lbCANCnVwZGF0
ZXMgdGhhdCBJIG1pZ2h0IGxpa2UuIEFuZCBiZWNhdXNlIHRoZXNlIGFyZSB0ZWNobmljYWxseSBs
ZWdhY3kgSSdtIA0KaGF2aW5nIGEgaGFyZCB0aW1lIGNvbnZpbmNpbmcgYW55b25lIHRvIGRlZGlj
YXRlIGFueSByZXNvdXJjZXMgdG8gDQpoZWxwaW5nIHdpdGggYW55IGVmZm9ydCB0byBpbXByb3Zl
IHRoZXNlIGRyaXZlcnMgKHdoYXRldmVyIGlzIGhhcHBlbmluZyANCmlzIGp1c3QgInNwYXJlIHRp
bWUiIHdvcmspLg0KDQpBcyBhIHVzZXIgSSBjYW4gc2F5IHRoYXQgd2UnZCBwcm9iYWJseSBiZSBP
SyBpZiB3ZSBoYWQgdG8gbWFrZSBzb21lIGR0cyANCnVwZGF0ZXMgYXMgd2Ugc2hpcCBvdXIga2Vy
bmVsK2R0Yitpbml0cmQgYXMgYSBGSVQgaW1hZ2Ugc28gd2UgY2FuIHVwZGF0ZSANCnRoZSBrZXJu
ZWwrZHRiIGF0IHRoZSBzYW1lIHRpbWUgaWYgbmVjZXNzYXJ5Lg0K
