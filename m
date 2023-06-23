Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AFD73BC93
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jun 2023 18:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjFWQby (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jun 2023 12:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjFWQbx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jun 2023 12:31:53 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CD21FE7;
        Fri, 23 Jun 2023 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1687537909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zAQ3gyjPrFqWR6rlol8Oe156M39AICYaSMz+ItUMoks=;
        b=R1lHDxv4CaiH1M6eIgNOlbMyUpD8rg3n3J+x3lHuNe95lyj8FjN6/SWjTj1uMgZjps/OOK
        QzE8wjju/EC83HyRYoin4LFQZFhYYKnCYHCOwIcS/DWOh1zcuJHhZyBzx71YF5wC7jZFlW
        AkwkmjeqU/vcqSr5cPLIFddxkPqCpck=
Message-ID: <62577492be3665a9a4ba66077d13fa1bef5e6ee3.camel@crapouillou.net>
Subject: Re: [PATCH] MIPS: DTS: CI20: Raise VDDCORE voltage to 1.125 volts
From:   Paul Cercueil <paul@crapouillou.net>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net
Date:   Fri, 23 Jun 2023 18:31:47 +0200
In-Reply-To: <59F0E1F0-C518-48D8-8AB9-97CA143DD36E@goldelico.com>
References: <20230622175934.71601-1-paul@crapouillou.net>
         <59F0E1F0-C518-48D8-8AB9-97CA143DD36E@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgTmlrb2xhdXMsCgpMZSB2ZW5kcmVkaSAyMyBqdWluIDIwMjMgw6AgMTg6MTMgKzAyMDAsIEgu
IE5pa29sYXVzIFNjaGFsbGVyIGEgw6ljcml0wqA6Cj4gSGkgUGF1bCwgVGhvbWFzLAo+IGhlcmUg
YXJlIG15IHRlc3QgcmVzdWx0cy4KPiAKPiA+IEFtIDIyLjA2LjIwMjMgdW0gMTk6NTkgc2Nocmll
YiBQYXVsIENlcmN1ZWlsCj4gPiA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Ogo+ID4gCj4gPiBDb21t
aXQgMDgzODRlODBhNzBmICgiTUlQUzogRFRTOiBDSTIwOiBGaXggQUNUODYwMCByZWd1bGF0b3Ig
bm9kZQo+ID4gbmFtZXMiKSBjYXVzZWQgdGhlIFZERENPUkUgcG93ZXIgc3VwcGx5IChyZWd1bGF0
ZWQgYnkgdGhlIEFDVDg2MDAncwo+ID4gRENEQzEgb3V0cHV0KSB0byBkcm9wIGZyb20gYSB2b2x0
YWdlIG9mIDEuMlYgY29uZmlndXJlZCBieSB0aGUKPiA+IGJvb3Rsb2FkZXIsIHRvIHRoZSAxLjFW
IHNldCBpbiB0aGUgRGV2aWNlIFRyZWUuCj4gPiAKPiA+IEFjY29yZGluZyB0byB0aGUgZG9jdW1l
bnRhdGlvbiwgdGhlIFZERENPUkUgc3VwcGx5IHNob3VsZCBiZQo+ID4gYmV0d2Vlbgo+ID4gMC45
OVYgYW5kIDEuMjFWOyBib3RoIHZhbHVlcyBhcmUgdGhlcmVmb3JlIHdpdGhpbiB0aGUgc3VwcG9y
dGVkCj4gPiByYW5nZS4KPiA+IAo+ID4gSG93ZXZlciwgVkREQ09SRSBiZWluZyAxLjFWIHJlc3Vs
dHMgaW4gdGhlIENJMjAgYmVpbmcgdmVyeQo+ID4gdW5zdGFibGUsCj4gPiB3aXRoIGNvcnJ1cHRl
ZCBtZW1vcnksIGZhaWx1cmVzIHRvIGJvb3QsIG9yIHJlYm9vdHMgYXQgcmFuZG9tLgo+IAo+IC4u
LiBhbmQgZGFtYWdpbmcgdGhlIGZpbGUgc3lzdGVtIG9uIFNEIGNhcmQuCj4gCj4gPiBUaGUKPiA+
IHJlYXNvbiBtaWdodCBiZSBzdWNjaW50IGRyb3BzIG9mIHRoZSB2b2x0YWdlIGJlbG93IHRoZSBt
aW5pbXVtCj4gPiByZXF1aXJlZC4KPiAKPiAxLiB3aXRoIHlvdXIgcGF0Y2hlcyAoZXhjZXB0IHRo
aXMgb25lKSBvbiB0b3Agb2YgdXBzdHJlYW0gdjYuNC1yYzcKPiBhbmQKPiBjaTIwX2RlZmNvbmZp
ZyBJIGNhbiBzdGlsbCBub3QgYm9vdCB3aXRoIDEuMTAwVi4KPiAKPiAyLiBidXQgYWxzbyBub3Qg
YXQgMS4xMjVWIGFzIGJ5IHRoaXMgcGF0Y2guCj4gW8KgwqDCoCAwLjY0NzYzN10gRENEQzE6IEJy
aW5naW5nIDEyMDAwMDB1ViBpbnRvIDExMjUwMDAtMTEyNTAwMHVWCj4gCj4gMy4gbXkgYm9hcmQg
bmVlZHMgMS4xNTBWIGFzIG1pbmltdW0sIHJlcG9ydGluZzoKPiBbwqDCoMKgIDAuNjQ3NjI3XSBE
Q0RDMTogQnJpbmdpbmcgMTIwMDAwMHVWIGludG8gMTE1MDAwMC0xMTUwMDAwdVYKCkhlaC4gSSB3
YXMgZmVhcmluZyB0aGlzIHdvdWxkIGJlIHRoZSBjYXNlLgoKPiAKPiBUaGF0IGlzIGdvb2QgbmV3
cyB0aGF0IGl0IGRvZXMgbm90IG5lZWQgMS4yMDBWIGF0IHRoZSB1cHBlciBsaW1pdC4KPiAKPiA0
LiBuZXh0LCB3aXRoIHRoaXMgc2V0dXAgSSBjYW4gc2VlIHRoZSBibHVldG9vdGggY2hpcCAod2l0
aCBkZWZhdWx0Cj4gTUFDCj4gYWRkcmVzcyA0MzozMDpCMTowMDowMDowMCksIGJ1dCBpdCBpcyBu
b3QgdXNlYWJsZSAobWF5YmUgbXkgdXNlcgo+IHNwYWNlKS4KPiAKPiBBbmQgdGhlcmUgbm8gV2lG
aS4gUmF0aGVyLCBJIGhhdmUgdG8gZGlzYWJsZSB0aGUgYnJjbWZtYWMgZHJpdmVyIG9yCj4gb3Ro
ZXJ3aXNlIEkgY2FuJ3QgZXZlbiBjb21wbGV0ZSBib290IChoYW5ncyBpbiBhIGxhdGVyIHN0YWdl
KSBhdCBhbGwuCgpNb3N0IGxpa2VseSBpdCdzIGJlY2F1c2Ugb2YgYW4gaW52YWxpZCBmaXJtd2Fy
ZSBmaWxlLiBJdCBoYXBwZW5lZCB0byBtZQp3aXRoIGV2ZXJ5IHNpbmdsZSBmaXJtd2FyZSBmaWxl
IChpbmNsdWRpbmcgdGhlIG9uZSBpbiB0aGUgbGludXgtCmZpcm13YXJlIHJlcG9zaXRvcnkgYXQg
dGhhdCB0aW1lKSBleGNlcHQgdGhlIG9uZSBmb3VuZCBvbiB0aGUgQ0kyMCdzCkRlYmlhbiBpbWFn
ZS4KClNpbmNlIHRoZW4gQnJvYWRjb20gZ3V5cyB1cGRhdGVkIHRoZSBmaXJtd2FyZSBpbiBsaW51
eC1maXJtd2FyZSB0byB0aGUKbmV3ZXN0IG9uZSB0aGV5IGhhZCwgd2hpY2ggd29ya3MgZmluZS4K
Cj4gNS4gZmluYWxseSB0aGUgbXlzdGVyaW91cyByZXN1bHQ6Cj4gCj4gV2l0aCBhbGwgdGhpcyBt
ZXJnZWQgd2l0aCB0aGUgbGV0dXgtb3Mga2VybmVsIChhbmQgbWFudWFsbHkgZml4aW5nCj4gbWlu
b3IKPiBtZXJnZSBjb25mbGljdHMpIGFuZCB1c2luZyBsZXR1eF9kZWZjb25maWcgSSBjYW4gYm9v
dC4gRXZlbiB3aXRoCj4gMS4xMDBWCj4gaW4gdGhlIGRldmljZSB0cmVlLCBjaGVja2VkIHdpdGgg
L3N5cy9rZXJuZWwvZGVidWcpOgo+IAo+IHJvb3RAbGV0dXg6fiMgY2F0IC9zeXMva2VybmVsL2Rl
YnVnL3JlZ3VsYXRvci9yZWd1bGF0b3Jfc3VtbWFyeSAKPiDCoHJlZ3VsYXRvcsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2Ugb3BlbiBieXBhc3PCoCBvcG1vZGUg
dm9sdGFnZQo+IGN1cnJlbnTCoMKgwqDCoCBtaW7CoMKgwqDCoCBtYXgKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0KPiDCoHJlZ3VsYXRvci1kdW1tecKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgM8KgwqDCoCAywqDCoMKgwqDCoCAwIHVua25vd27CoMKgwqDCoCAw
bVbCoMKgwqDCoAo+IDBtQcKgwqDCoMKgIDBtVsKgwqDCoMKgIDBtViAKPiDCoMKgwqAgMTM1MDAw
MDAudXNiLXZ1c2JfYcKgwqDCoMKgwqDCoMKgwqDCoMKgIDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gMG1BwqDCoMKgwqAg
MG1WwqDCoMKgwqAgMG1WCj4gwqDCoMKgIDEzNTAwMDAwLnVzYi12dXNiX2TCoMKgwqDCoMKgwqDC
oMKgwqDCoCAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoAo+IDBtQcKgwqDCoMKgIDBtVsKgwqDCoMKgIDBtVgo+IMKgZXRoMF9w
b3dlcsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDHCoMKgwqAg
McKgwqDCoMKgwqAgMCB1bmtub3duwqAgMzMwMG1WwqDCoMKgwqAKPiAwbUHCoCAzMzAwbVbCoCAz
MzAwbVYgCj4gwqDCoMKgIDE2MDAwMDAwLmRtOTAwMC12Y2PCoMKgwqDCoMKgwqDCoMKgwqDCoCAx
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoAo+IDBtQcKgwqDCoMKgIDBtVsKgwqDCoMKgIDBtVgo+IMKgb3RnX3Bvd2VywqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgIDLCoMKgwqDC
oMKgIDAgdW5rbm93bsKgIDUwMDBtVsKgwqDCoMKgCj4gMG1BwqAgNTAwMG1WwqAgNTAwMG1WIAo+
IMKgwqDCoCAxMDAwMDAzYy51c2ItcGh5LXZjY8KgwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+
IDBtQcKgwqDCoMKgIDBtVsKgwqDCoMKgIDBtVgo+IMKgwqDCoCB1c2JfcGh5LXZjY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IDBtQcKgwqDCoMKgIDBtVsKg
wqDCoMKgIDBtVgo+IMKgdmNjXzMzdsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDjCoMKgwqAgOcKgwqDCoMKgwqAgMCB1bmtub3duwqAgMzMwMG1WwqDC
oMKgwqAKPiAwbUHCoCAzMzAwbVbCoCAzMzAwbVYgCj4gwqDCoMKgIDEzNDUwMDAwLm1tYy12cW1t
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiAwbUHCoMKgwqDCoCAwbVbCoMKgwqDC
oCAwbVYKPiDCoMKgwqAgMTM0NTAwMDAubW1jLXZtbWPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAKPiAwbUHCoCAzMzAwbVbCoCAzNDAwbVYKPiDCoMKgwqAgRENEQzHCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMcKgwqDCoCAwwqDCoMKgwqDC
oCAwIHN0YW5kYnnCoCAxMTAwbVbCoMKgwqDCoAo+IDBtQcKgIDExMDBtVsKgIDExMDBtViAKPiDC
oMKgwqAgRENEQzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMcKgwqDCoCAwwqDCoMKgwqDCoCAwIHN0YW5kYnnCoCAxNTAwbVbCoMKgwqDCoAo+IDBtQcKg
IDE1MDBtVsKgIDE1MDBtViAKPiDCoMKgwqAgRENEQzPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMcKgwqDCoCAwwqDCoMKgwqDCoCAwIHVua25vd27CoCAz
MzAwbVbCoMKgwqDCoAo+IDBtQcKgIDMzMDBtVsKgIDMzMDBtViAKPiDCoMKgwqAgTERPNcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDHCoMKgwqAgMMKg
wqDCoMKgwqAgMCB1bmtub3duwqAgMjUwMG1WwqDCoMKgwqAKPiAwbUHCoCAyNTAwbVbCoCAyNTAw
bVYgCj4gwqDCoMKgIExETzbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxwqDCoMKgIDHCoMKgwqDCoMKgIDDCoCBub3JtYWzCoCAxODAwbVbCoMKgwqDC
oAo+IDBtQcKgIDE4MDBtVsKgIDE4MDBtViAKPiDCoMKgwqDCoMKgwqAgMTM0NjAwMDAubW1jLXZx
bW1jwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IDBtQcKgwqDCoMKgIDBtVsKgwqDCoMKgIDBt
Vgo+IMKgwqDCoCBMRE83wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMMKgwqDCoCAwwqDCoMKgwqDCoCAwIHVua25vd27CoCAyODAwbVbCoMKgwqDCoAo+
IDBtQcKgIDI4MDBtVsKgIDI4MDBtViAKPiDCoMKgwqAgTERPOMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDDCoMKgwqAgMMKgwqDCoMKgwqAgMCB1bmtu
b3duwqAgMTUwMG1WwqDCoMKgwqAKPiAwbUHCoCAxNTAwbVbCoCAxNTAwbVYgCj4gwqBTVURDRENf
UkVHNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAywqDCoMKgIDHC
oMKgwqDCoMKgIDDCoCBub3JtYWzCoCA1MDAwbVbCoMKgwqDCoAo+IDBtQcKgIDUwMDBtVsKgIDUw
MDBtViAKPiDCoMKgwqAgYnRfcG93ZXLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMsKgwqDCoCAxwqDCoMKgwqDCoCAwIHVua25vd27CoCAzMzAwbVbCoMKgwqDCoAo+
IDBtQcKgIDMzMDBtVsKgIDMzMDBtViAKPiDCoMKgwqDCoMKgwqAgd2lmaV9wb3dlcsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDLCoMKgwqAgMcKgwqDCoMKgwqAgMCB1bmtub3duwqAg
MzMwMG1WwqDCoMKgwqAKPiAwbUHCoCAzMzAwbVbCoCAzMzAwbVYgCj4gwqDCoMKgwqDCoMKgwqDC
oMKgIDEzNDYwMDAwLm1tYy12bW1jwqDCoMKgwqDCoMKgIDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gMG1BwqAgMzMwMG1W
wqAgMzQwMG1WCj4gwqBMRE9fUkVHOcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAxwqDCoMKgIDDCoMKgwqDCoMKgIDAgdW5rbm93bsKgIDMzMDBtVsKgwqDC
oMKgCj4gMG1BwqAgMzMwMG1WwqAgMzMwMG1WIAo+IMKgTERPX1JFRzEwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgIDDCoMKgwqDCoMKgIDAgdW5r
bm93bsKgIDEyMDBtVsKgwqDCoMKgCj4gMG1BwqAgMTIwMG1WwqAgMTIwMG1WIAo+IHJvb3RAbGV0
dXg6fiMgdW5hbWUgLWEKPiBMaW51eCBsZXR1eCA2LjQuMC1yYzctbGV0dXgtY2kyMCsgIzEzODgx
IFNNUCBQUkVFTVBUIEZyaSBKdW4gMjMKPiAxNzoyMzo0MiBDRVNUIDIwMjMgbWlwcyBHTlUvTGlu
dXgKPiByb290QGxldHV4On4jIAo+IAo+IEFuZCBJIHRoZXJlIGhhdmUgV2lGaSB3b3JraW5nIGZp
bmUuCj4gCj4gQnV0IG5vIEJsdWV0b290aCBpbnRlcmZhY2UgYXQgYWxsIChhbHRob3VnaCBkcml2
ZXIgaXMgY29tcGlsZWQpLgo+IAo+IEEgcG90ZW50aWFsIGhpbnQgY291bGQgYmUgdGhhdCBEQ0RD
MSBpcyBlbmFibGVkIGEgbGl0dGxlIGxhdGVyIGR1cmluZwo+IGJvb3QgdGhhbiB3aXRoIGNpMjBf
ZGVmY29uZmlnOgo+IAo+IFvCoMKgwqAgMS4wNzc5MjZdIERDREMxOiBCcmluZ2luZyAxMjAwMDAw
dVYgaW50byAxMTAwMDAwLTExMDAwMDB1Vgo+IFvCoMKgwqAgMS4wOTY5OTddIERDREMxOiAxMTAw
IG1WLCBlbmFibGVkCj4gCj4gQW5kIGFub3RoZXIgdGVzdCB3aXRoIHRyeWluZyAxLjAwMFYgaGFu
Z3MgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhpczoKPiAKPiBbwqDCoMKgIDEuMDMyODQ2XSBEQ0RDMTog
QnJpbmdpbmcgMTIwMDAwMHVWIGludG8gMTAwMDAwMC0xMDAwMDAwdVYKPiAKPiBNYXliZSBpdCBp
cyBhIHRvbyBiaWcgc3RlcCBkdXJpbmcgb3BlcmF0aW9uLgoKMS4wViBpcyBhYm91dCBhcyBsb3cg
YXMgeW91IGNhbiBnZXQgd2l0aCB0aGVvcmljYWxseSBwZXJmZWN0IHBvd2VyCnN1cHBseSwgSSBk
b3VidCB0aGF0IHlvdSBjYW4gdXNlIHRoaXMgdm9sdGFnZSBpbiB0aGUgcmVhbCB3b3JsZC4KCkl0
J3Mgc3RyYW5nZSB0aGF0IHlvdXIgbGV0dXgga2VybmVsIGNhbiBzZXQgMS4xViBhbmQgYmUgc3Rh
YmxlLCB3aGlsZQp5b3UgbmVlZCAxLjE1ViB3aXRoIHRoZSB1cHN0cmVhbSBrZXJuZWwuIEkgd29u
ZGVyIHdoYXQgY291bGQgYmUgdGhlCmNhdXNlLgoKPiAKPiBGb3IgdGhlIHJlY29yZHM6Cj4gCj4g
LSBJIGp1c3Qgc3dhcHBlZCB0aGUgY2xlYW4gY29tcGlsZWQgdUltYWdlLCBrZXJuZWwgbW9kdWxl
cyBhbmQKPiBjaTIwLmR0Ygo+IMKgIGJldHdlZW4gYWxsIHRoZXNlIHRlc3RzIChhbmQgZnNjayB0
aGUgU0QgY2FyZCBiZWZvcmUpLgo+IAo+IC0gd2UgaGF2ZSBzb21lIGV4cGVyaW1lbnRhbCBTTVAg
cGF0Y2hlcyBieSBZYW5qaWUgWmhvdSAoYW5kIG90aGVyCj4gbmljZQo+IMKgIHN0dWZmIG5vdCBw
dXNoZWQgdXBzdHJlYW0pIGluIHRoZSBMZXR1eCBrZXJuZWwgc28gdGhhdCBhbnkgb2YgdGhlcwo+
IMKgIG1heSBoYXZlIGFuIGluZmx1ZW5jZS4KPiAKPiBTbyBJJ2Qgc2F5IGxldCdzIHBvc3Rwb25l
IHRoaXMgMS4xMjVWIHBhdGNoIHVudGlsIHlvdXIgb3RoZXIgcGF0Y2hlcwo+IGFycml2ZSB1cHN0
cmVhbS4gVGhlbiBJIHdpbGwgcmViYXNlIG91ciBMZXR1eCBrZXJuZWwgYW55d2F5cyBhbmQgdGhl
bgo+IEkgY2FuIGFuYWx5c2UgYSBsaXR0bGUgZWFzaWVyIHdoYXQgbWFrZXMgYWxsIHRoZXNlIGRp
ZmZlcmVuY2VzCj4gKGJlY2F1c2UKPiB0aGVuIG5vIG1lcmdlIGFuZCBtYW51YWwgY29uZmxpY3Qg
cmVzb2x1dGlvbiBpcyBpbnZvbHZlZCBhbnkgbW9yZSBhbmQKPiB0aGVyZSBhcmUgYmV0dGVyIGNo
YW5jZXMgZm9yIGEgYmlzZWN0IHRvIGJlIGhlbHBmdWwpLgoKVGhvbWFzIGFscmVhZHkgbWVyZ2Vk
IGl0LCBzbyBJIGd1ZXNzIHdlIGhhdmUgMS4xMjVWIG5vdy4KCldoaWNoIGlzIGJldHRlciB0aGFu
IG5vdGhpbmc7IGluc3RlYWQgb2Ygbm90IHdvcmtpbmcgb24gYm90aCBvdXIKYm9hcmRzLCBhdCBs
ZWFzdCBub3cgdjYuNCB3aWxsIHdvcmsgb24gb25lIG9mIHRoZW0gOykKCk5vdGUgdGhhdCBJIHdh
cyB0ZXN0aW5nIG15IHBhdGNoZXMgb24gdG9wIG9mIHRoZSB2YW5pbGxhIGtlcm5lbCwKd2l0aG91
dCBhbnkgbG9jYWwgcGF0Y2hlcy4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IE5pa29sYXVzCgpDaGVl
cnMsCi1QYXVsCj4gCgo+ID4gUmFpc2luZyB0aGUgbWluaW11bSB2b2x0YWdlIHRvIDEuMTI1IHZv
bHRzIHNlZW1zIHRvIGJlIGVub3VnaCB0bwo+ID4gYWRkcmVzcwo+ID4gdGhpcyBpc3N1ZSwgd2hp
bGUgc3RpbGwga2VlcGluZyBhIHJlbGF0aXZlbHkgbG93IGNvcmUgdm9sdGFnZSB3aGljaAo+ID4g
aGVscHMgZm9yIHBvd2VyIGNvbnN1bXB0aW9uIGFuZCB0aGVybWFscy4KPiA+IAo+ID4gRml4ZXM6
IDA4Mzg0ZTgwYTcwZiAoIk1JUFM6IERUUzogQ0kyMDogRml4IEFDVDg2MDAgcmVndWxhdG9yIG5v
ZGUKPiA+IG5hbWVzIikKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3Jh
cG91aWxsb3UubmV0Pgo+ID4gCj4gPiAtLS0KPiA+IENjOiBILiBOaWtvbGF1cyBTY2hhbGxlciA8
aG5zQGdvbGRlbGljby5jb20+Cj4gPiAtLS0KPiA+IGFyY2gvbWlwcy9ib290L2R0cy9pbmdlbmlj
L2NpMjAuZHRzIHwgNCArKy0tCj4gPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Jvb3QvZHRzL2lu
Z2VuaWMvY2kyMC5kdHMKPiA+IGIvYXJjaC9taXBzL2Jvb3QvZHRzL2luZ2VuaWMvY2kyMC5kdHMK
PiA+IGluZGV4IGNlYzBjYWEyMzUwYy4uYTE0MWE2OTliNzkwIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9taXBzL2Jvb3QvZHRzL2luZ2VuaWMvY2kyMC5kdHMKPiA+ICsrKyBiL2FyY2gvbWlwcy9ib290
L2R0cy9pbmdlbmljL2NpMjAuZHRzCj4gPiBAQCAtMjk4LDggKzI5OCw4IEBAIGFjdDg2MDA6IGFj
dDg2MDBANWEgewo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ3Vs
YXRvcnMgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdmRkY29yZTogRENEQzEgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPQo+
ID4gPDExMDAwMDA+Owo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPQo+ID4gPDEx
MDAwMDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPQo+ID4gPDExMjUwMDA+
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPQo+ID4gPDExMjUwMDA+Owo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHZwMS1zdXBwbHkgPSA8JnZjY18zM3Y+Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ3VsYXRvci1hbHdh
eXMtb247Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Owo+ID4gLS0gCj4gPiAyLjQwLjEKPiA+IAo+IAoK

