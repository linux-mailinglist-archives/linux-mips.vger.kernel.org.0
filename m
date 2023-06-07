Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82380725AA8
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jun 2023 11:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239596AbjFGJgc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Jun 2023 05:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240134AbjFGJg3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Jun 2023 05:36:29 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A0DEB;
        Wed,  7 Jun 2023 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1686130568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WKIpGmawNtMHLJaHFoOVSRh/1EAqoRpsO5lh5VvkGPA=;
        b=xYp4uyUH3cDlznGkBMNlQLD91pMKL+k6EJUBXiTCzOrDRFOyOJ5f5HOulCpse6vCBnB5Ur
        xbxwGz5lK2ZO8m26JXf4mz04pH1EoAy6pV4HtejIp2DNRjbqErj1LkhR0NkSWBzRfNUZwA
        97M3valHH6T9+5c3YD2zILTsf2GUmA4=
Message-ID: <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
From:   Paul Cercueil <paul@crapouillou.net>
To:     Sui Jingfeng <suijingfeng@loongson.cn>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        loongson-kernel@lists.loongnix.cn
Date:   Wed, 07 Jun 2023 11:36:05 +0200
In-Reply-To: <20230607053053.345101-1-suijingfeng@loongson.cn>
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
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

SGkgU3VpLAoKTGUgbWVyY3JlZGkgMDcganVpbiAyMDIzIMOgIDEzOjMwICswODAwLCBTdWkgSmlu
Z2ZlbmcgYSDDqWNyaXTCoDoKPiBUaGUgc2luZ2xlIG1hcF9ub25jb2hlcmVudCBtZW1iZXIgb2Yg
c3RydWN0IGRybV9nZW1fZG1hX29iamVjdCBtYXkKPiBub3QKPiBzdWZmaWNpZW50IGZvciBkZXNj
cmliaW5nIHRoZSBiYWNraW5nIG1lbW9yeSBvZiB0aGUgR0VNIGJ1ZmZlcgo+IG9iamVjdC4KPiAK
PiBFc3BlY2lhbGx5IG9uIGRtYS1jb2hlcmVudCBzeXN0ZW1zLCB0aGUgYmFja2luZyBtZW1vcnkg
aXMgYm90aCBjYWNoZWQKPiBjb2hlcmVudCBmb3IgbXVsdGktY29yZSBDUFVzIGFuZCBkbWEtY29o
ZXJlbnQgZm9yIHBlcmlwaGVyYWwgZGV2aWNlLgo+IFNheSBhcmNoaXRlY3R1cmVzIGxpa2UgWDg2
LTY0LCBMb29uZ0FyY2g2NCwgTG9vbmdzb24gTWlwczY0LCBldGMuCj4gCj4gV2hldGhlciBhIHBl
cmlwaGVyYWwgZGV2aWNlIGlzIGRtYS1jb2hlcmVudCBvciBub3QgY2FuIGJlCj4gaW1wbGVtZW50
YXRpb24tZGVwZW5kZW50LiBUaGUgc2luZ2xlIG1hcF9ub25jb2hlcmVudCBvcHRpb24gaXMgbm90
Cj4gZW5vdWdoCj4gdG8gcmVmbGVjdCByZWFsIGhhcmR3YXJlIGFueW1vcmUuIEZvciBleGFtcGxl
LCB0aGUgTG9vbmdzb24gTFMzQTQwMDAKPiBDUFUKPiBhbmQgTFMySzIwMDAvTFMySzEwMDAgU29D
LCBwZXJpcGhlcmFsIGRldmljZSBvZiBzdWNoIGhhcmR3YXJlCj4gcGxhdGZvcm0KPiBhbGx3YXlz
IHNub29wIENQVSdzIGNhY2hlLiBEb2luZyB0aGUgYWxsb2NhdGlvbiB3aXRoCj4gZG1hX2FsbG9j
X2NvaGVyZW50Cj4gZnVuY3Rpb24gaXMgcHJlZmVycmVkLiBUaGUgcmV0dXJuIGJ1ZmZlciBpcyBj
YWNoZWQsIGl0IHNob3VsZCBub3QKPiB1c2luZwo+IHRoZSBkZWZhdWx0IHdyaXRlLWNvbWJpbmUg
bWFwcGluZy4gV2hpbGUgd2l0aCB0aGUgY3VycmVudCBpbXBsZW1lbnQsCj4gdGhlcmUKPiBubyB3
YXkgdG8gdGVsbCB0aGUgZHJtIGNvcmUgdG8gcmVmbGVjdCB0aGlzLgo+IAo+IFRoaXMgcGF0Y2gg
YWRkcyBjYWNoZWQgYW5kIGNvaGVyZW50IG1lbWJlcnMgdG8gc3RydWN0Cj4gZHJtX2dlbV9kbWFf
b2JqZWN0Lgo+IHdoaWNoIGFsbG93IGRyaXZlciBpbXBsZW1lbnRzIHRvIGluZm9ybSB0aGUgY29y
ZS4gSW50cm9kdWNpbmcgbmV3Cj4gbWFwcGluZ3MKPiB3aGlsZSBrZWVwaW5nIHRoZSBvcmlnaW5h
bCBkZWZhdWx0IGJlaGF2aW9yIHVuY2hhbmdlZC4KCkRpZCB5b3UgdHJ5IHRvIHNpbXBseSBzZXQg
dGhlICJkbWEtY29oZXJlbnQiIHByb3BlcnR5IHRvIHRoZSBkZXZpY2Uncwpub2RlPwoKRnJvbSB3
aGF0IEkgdW5kZXJzdGFuZCBpZiB5b3UgYWRkIHRoYXQgcHJvcGVydHkgdGhlbiBMaW51eCB3aWxs
IHVzZSBETUEKY29oZXJlbnQgbWVtb3J5IGV2ZW4gdGhvdWdoIHlvdSB1c2UgZG1hX2FsbG9jX25v
bmNvaGVyZW50KCkgYW5kIHRoZQpzeW5jX3NpbmdsZV9mb3JfY3B1KCkgLyBzeW5jX3NpbmdsZV9m
b3JfZGV2aWNlKCkgYXJlIHRoZW4gTk9Qcy4KCkNoZWVycywKLVBhdWwKCj4gU2lnbmVkLW9mZi1i
eTogU3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4KPiAtLS0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfZG1hX2hlbHBlci5jwqDCoMKgwqDCoMKgIHwgMTEgKysrKystLS0t
LS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1hLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZG1hX2hlbHBlci5jwqDCoMKg
wqDCoCB8IDIwICsrKysrKysrKysrKysrKystLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vaW5nZW5p
Yy9pbmdlbmljLWRybS1kcnYuYyB8wqAgNSArKysrLQo+IMKgZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0tCj4gwqBkcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jwqDCoMKgwqAgfMKgIDQgKysrLQo+IMKgaW5jbHVkZS9k
cm0vZHJtX2dlbV9kbWFfaGVscGVyLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrKystLQo+
IMKgNyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9kbWFfaGVscGVyLmMKPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfZG1hX2hlbHBlci5jCj4gaW5kZXggM2I1MzVhZDFiMDdjLi45
M2ZmMDUwNDExOTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9kbWFfaGVs
cGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2RtYV9oZWxwZXIuYwo+IEBAIC0x
MDYsMTYgKzEwNiwxNSBAQCBkbWFfYWRkcl90IGRybV9mYl9kbWFfZ2V0X2dlbV9hZGRyKHN0cnVj
dAo+IGRybV9mcmFtZWJ1ZmZlciAqZmIsCj4gwqBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZmJfZG1h
X2dldF9nZW1fYWRkcik7Cj4gwqAKPiDCoC8qKgo+IC0gKiBkcm1fZmJfZG1hX3N5bmNfbm9uX2Nv
aGVyZW50IC0gU3luYyBHRU0gb2JqZWN0IHRvIG5vbi1jb2hlcmVudAo+IGJhY2tpbmcKPiAtICrC
oMKgwqDCoMKgbWVtb3J5Cj4gKyAqIGRybV9mYl9kbWFfc3luY19ub25fY29oZXJlbnQgLSBTeW5j
IEdFTSBvYmplY3QgdG8gY2FjaGVkIGJhY2tpbmcKPiBtZW1vcnkKPiDCoCAqIEBkcm06IERSTSBk
ZXZpY2UKPiDCoCAqIEBvbGRfc3RhdGU6IE9sZCBwbGFuZSBzdGF0ZQo+IMKgICogQHN0YXRlOiBO
ZXcgcGxhbmUgc3RhdGUKPiDCoCAqCj4gwqAgKiBUaGlzIGZ1bmN0aW9uIGNhbiBiZSB1c2VkIGJ5
IGRyaXZlcnMgdGhhdCB1c2UgZGFtYWdlIGNsaXBzIGFuZAo+IGhhdmUKPiAtICogRE1BIEdFTSBv
YmplY3RzIGJhY2tlZCBieSBub24tY29oZXJlbnQgbWVtb3J5LiBDYWxsaW5nIHRoaXMKPiBmdW5j
dGlvbgo+IC0gKiBpbiBhIHBsYW5lJ3MgLmF0b21pY191cGRhdGUgZW5zdXJlcyB0aGF0IGFsbCB0
aGUgZGF0YSBpbiB0aGUKPiBiYWNraW5nCj4gLSAqIG1lbW9yeSBoYXZlIGJlZW4gd3JpdHRlbiB0
byBSQU0uCj4gKyAqIERNQSBHRU0gb2JqZWN0cyBiYWNrZWQgYnkgY2FjaGVkIG1lbW9yeS4gQ2Fs
bGluZyB0aGlzIGZ1bmN0aW9uIGluCj4gYQo+ICsgKiBwbGFuZSdzIC5hdG9taWNfdXBkYXRlIGVu
c3VyZXMgdGhhdCBhbGwgdGhlIGRhdGEgaW4gdGhlIGJhY2tpbmcKPiBtZW1vcnkKPiArICogaGF2
ZSBiZWVuIHdyaXR0ZW4gdG8gUkFNLgo+IMKgICovCj4gwqB2b2lkIGRybV9mYl9kbWFfc3luY19u
b25fY29oZXJlbnQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRy
bV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlLAo+IEBAIC0xMzEsNyArMTMwLDcgQEAgdm9pZCBkcm1f
ZmJfZG1hX3N5bmNfbm9uX2NvaGVyZW50KHN0cnVjdAo+IGRybV9kZXZpY2UgKmRybSwKPiDCoAo+
IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgZmluZm8tPm51bV9wbGFuZXM7IGkrKykg
ewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX29iaiA9IGRybV9mYl9kbWFf
Z2V0X2dlbV9vYmooc3RhdGUtPmZiLCBpKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKCFkbWFfb2JqLT5tYXBfbm9uY29oZXJlbnQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmIChkbWFfb2JqLT5jYWNoZWQgJiYgZG1hX29iai0+Y29oZXJlbnQpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWU7Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRhZGRyID0gZHJtX2ZiX2RtYV9n
ZXRfZ2VtX2FkZHIoc3RhdGUtPmZiLCBzdGF0ZSwgaSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJkZXZfZG1hLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1h
LmMKPiBpbmRleCBkODY3NzNmYThhYjAuLjQ5ZmU5YjI4NGNjOCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
YmRldl9kbWEuYwo+IEBAIC0xMzEsNyArMTMxLDcgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZG1h
X2hlbHBlcl9mYl9wcm9iZShzdHJ1Y3QKPiBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsCj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgLyogc2NyZWVuICovCj4gwqDCoMKgwqDCoMKgwqDCoGluZm8tPmZs
YWdzIHw9IEZCSU5GT19WSVJURkI7IC8qIHN5c3RlbSBtZW1vcnkgKi8KPiAtwqDCoMKgwqDCoMKg
wqBpZiAoZG1hX29iai0+bWFwX25vbmNvaGVyZW50KQo+ICvCoMKgwqDCoMKgwqDCoGlmIChkbWFf
b2JqLT5jYWNoZWQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbmZvLT5mbGFn
cyB8PSBGQklORk9fUkVBRFNfRkFTVDsgLyogc2lnbmFsIGNhY2hpbmcKPiAqLwo+IMKgwqDCoMKg
wqDCoMKgwqBpbmZvLT5zY3JlZW5fc2l6ZSA9IHNpemVzLT5zdXJmYWNlX2hlaWdodCAqIGZiLT5w
aXRjaGVzWzBdOwo+IMKgwqDCoMKgwqDCoMKgwqBpbmZvLT5zY3JlZW5fYnVmZmVyID0gbWFwLnZh
ZGRyOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9kbWFfaGVscGVyLmMK
PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuYwo+IGluZGV4IDg3MGI5MGI3
OGJjNC4uZGVjMWQ1MTJiZGYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X2RtYV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIu
Ywo+IEBAIC05Myw3ICs5MywxMSBAQCBfX2RybV9nZW1fZG1hX2NyZWF0ZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLAo+IHNpemVfdCBzaXplLCBib29sIHByaXZhdGUpCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoZHJtLCBnZW1fb2Jq
LCBzaXplKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogQWx3YXlz
IHVzZSB3cml0ZWNvbWJpbmUgZm9yIGRtYS1idWYgbWFwcGluZ3MgKi8KPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZG1hX29iai0+bWFwX25vbmNvaGVyZW50ID0gZmFsc2U7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIEZJWE1FOiBUaGlzIGlzIG5vdCBhbHdheXMg
dHJ1ZSwgb24gc29tZSBkbWEKPiBjb2hlcmVudCBzeXN0ZW0sCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIGNhY2hlZCBtYXBwaW5ncyBzaG91bGQgYmUgcHJlZmVycmVkIG92ZXIK
PiB3cml0ZWNvbWJpbmUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9vYmotPmNhY2hlZCA9IGZhbHNlOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfb2JqLT5jb2hlcmVudCA9IGZhbHNlOwo+
IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gZHJtX2dlbV9vYmplY3RfaW5pdChkcm0sIGdlbV9vYmosIHNpemUpOwo+IMKgwqDC
oMKgwqDCoMKgwqB9Cj4gQEAgLTE0Myw3ICsxNDcsMTEgQEAgc3RydWN0IGRybV9nZW1fZG1hX29i
amVjdAo+ICpkcm1fZ2VtX2RtYV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKElTX0VSUihkbWFfb2JqKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiBkbWFfb2JqOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgaWYgKGRtYV9v
YmotPm1hcF9ub25jb2hlcmVudCkgewo+ICvCoMKgwqDCoMKgwqDCoGlmIChkbWFfb2JqLT5jYWNo
ZWQgJiYgZG1hX29iai0+Y29oZXJlbnQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZG1hX29iai0+dmFkZHIgPSBkbWFfYWxsb2NfY29oZXJlbnQoZHJtLT5kZXYsIHNpemUsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmRtYV9vYmotCj4g
PmRtYV9hZGRyLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEdGUF9LRVJORUwgfAo+IF9fR0ZQX05PV0FSTik7Cj4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlm
IChkbWFfb2JqLT5jYWNoZWQgJiYgIWRtYV9vYmotPmNvaGVyZW50KSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfb2JqLT52YWRkciA9IGRtYV9hbGxvY19ub25jb2hlcmVu
dChkcm0tPmRldiwKPiBzaXplLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAmZG1hX29iai0KPiA+ZG1hX2FkZHIsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERNQV9UT19ERVZJQ0UsCj4gQEAg
LTE1Myw2ICsxNjEsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0Cj4gKmRybV9nZW1fZG1h
X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmZG1hX29iai0+ZG1hX2FkZHIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEdGUF9LRVJORUwgfAo+IF9fR0ZQX05PV0FSTik7Cj4gwqDCoMKgwqDCoMKgwqDC
oH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghZG1hX29iai0+dmFkZHIpIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kYmcoZHJtLCAiZmFpbGVkIHRvIGFsbG9jYXRl
IGJ1ZmZlciB3aXRoIHNpemUKPiAlenVcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUpOwo+IEBAIC0yMzMsNyArMjQyLDEwIEBAIHZvaWQg
ZHJtX2dlbV9kbWFfZnJlZShzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0Cj4gKmRtYV9vYmopCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2J1Zl92
dW5tYXBfdW5sb2NrZWQoZ2VtX29iai0KPiA+aW1wb3J0X2F0dGFjaC0+ZG1hYnVmLCAmbWFwKTsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wcmltZV9nZW1fZGVzdHJveShn
ZW1fb2JqLCBkbWFfb2JqLT5zZ3QpOwo+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKGRtYV9v
YmotPnZhZGRyKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChkbWFfb2Jq
LT5tYXBfbm9uY29oZXJlbnQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChk
bWFfb2JqLT5jYWNoZWQgJiYgZG1hX29iai0+Y29oZXJlbnQpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfZnJlZV9jb2hlcmVudChnZW1fb2JqLT5k
ZXYtPmRldiwgZG1hX29iai0KPiA+YmFzZS5zaXplLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkbWFfb2JqLT52YWRkciwgZG1hX29iai0KPiA+ZG1hX2FkZHIpOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChkbWFfb2JqLT5jYWNoZWQgJiYgIWRtYV9vYmotPmNv
aGVyZW50KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGRtYV9mcmVlX25vbmNvaGVyZW50KGdlbV9vYmotPmRldi0+ZGV2LAo+IGRtYV9vYmotPmJhc2Uu
c2l6ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9vYmotPnZhZGRyLCBk
bWFfb2JqLQo+ID5kbWFfYWRkciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERN
QV9UT19ERVZJQ0UpOwo+IEBAIC01MzIsNyArNTQ0LDcgQEAgaW50IGRybV9nZW1fZG1hX21tYXAo
c3RydWN0IGRybV9nZW1fZG1hX29iamVjdAo+ICpkbWFfb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKgo+IMKgwqDCoMKgwqDCoMKgwqB2bWEtPnZtX3Bnb2ZmIC09IGRybV92bWFfbm9kZV9zdGFy
dCgmb2JqLT52bWFfbm9kZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHZtX2ZsYWdzX21vZCh2bWEsIFZN
X0RPTlRFWFBBTkQsIFZNX1BGTk1BUCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoZG1hX29i
ai0+bWFwX25vbmNvaGVyZW50KSB7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKGRtYV9vYmotPmNhY2hl
ZCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdm1hLT52bV9wYWdlX3Byb3Qg
PSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkbWFfbW1hcF9wYWdlcyhkbWFfb2JqLT5iYXNlLmRldi0+
ZGV2LAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1k
cnYuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMKPiBpbmRl
eCA1ZWM3NWU5YmE0OTkuLmEzZGYyZjk5YTc1NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdl
bmljL2luZ2VuaWMtZHJtLWRydi5jCj4gQEAgLTkxOSw3ICs5MTksMTAgQEAgaW5nZW5pY19kcm1f
Z2VtX2NyZWF0ZV9vYmplY3Qoc3RydWN0IGRybV9kZXZpY2UKPiAqZHJtLCBzaXplX3Qgc2l6ZSkK
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFvYmopCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoG9iai0+
bWFwX25vbmNvaGVyZW50ID0gcHJpdi0+c29jX2luZm8tPm1hcF9ub25jb2hlcmVudDsKPiArwqDC
oMKgwqDCoMKgwqBpZiAocHJpdi0+c29jX2luZm8tPm1hcF9ub25jb2hlcmVudCkgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvYmotPmNhY2hlZCA9IHRydWU7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9iai0+Y29oZXJlbnQgPSBmYWxzZTsKPiArwqDCoMKgwqDC
oMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuICZvYmotPmJhc2U7Cj4gwqB9Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci0KPiBkdS9LY29uZmlnCj4gaW5kZXggNTNjMzU2YWVkNWQ1Li5kZGRjNzBjMDhi
ZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tjb25maWcKPiBAQCAtMiw4ICsyLDYgQEAKPiDCoGNv
bmZpZyBEUk1fUkNBUl9EVQo+IMKgwqDCoMKgwqDCoMKgwqB0cmlzdGF0ZSAiRFJNIFN1cHBvcnQg
Zm9yIFItQ2FyIERpc3BsYXkgVW5pdCIKPiDCoMKgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBEUk0g
JiYgT0YKPiAtwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIEFSTSB8fCBBUk02NAo+IC3CoMKgwqDC
oMKgwqDCoGRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVAo+IMKgwqDCoMKg
wqDCoMKgwqBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiDCoMKgwqDCoMKgwqDCoMKgc2VsZWN0IERS
TV9HRU1fRE1BX0hFTFBFUgo+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgVklERU9NT0RFX0hFTFBF
UlMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+IGluZGV4IGFkZmIzNmIw
ZTgxNS4uMTE0MmQ1MTQ3M2U2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2tt
cy5jCj4gQEAgLTM4Niw3ICszODYsOSBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QKPiAqcmNhcl9k
dV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gwqDC
oMKgwqDCoMKgwqDCoGdlbV9vYmotPmZ1bmNzID0gJnJjYXJfZHVfZ2VtX2Z1bmNzOwo+IMKgCj4g
wqDCoMKgwqDCoMKgwqDCoGRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdChkZXYsIGdlbV9vYmos
IGF0dGFjaC0+ZG1hYnVmLQo+ID5zaXplKTsKPiAtwqDCoMKgwqDCoMKgwqBkbWFfb2JqLT5tYXBf
bm9uY29oZXJlbnQgPSBmYWxzZTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZG1hX29iai0+Y2FjaGVk
ID0gZmFsc2U7Cj4gK8KgwqDCoMKgwqDCoMKgZG1hX29iai0+Y29oZXJlbnQgPSBmYWxzZTsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldChnZW1f
b2JqKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuaAo+IGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9kbWFfaGVs
cGVyLmgKPiBpbmRleCA4YTA0MzIzNWRhZDguLjU4NWNlM2Q0ZDFlYiAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9n
ZW1fZG1hX2hlbHBlci5oCj4gQEAgLTE2LDcgKzE2LDkgQEAgc3RydWN0IGRybV9tb2RlX2NyZWF0
ZV9kdW1iOwo+IMKgICrCoMKgwqDCoMKgwqAgbW9yZSB0aGFuIG9uZSBlbnRyeSBidXQgdGhleSBh
cmUgZ3VhcmFudGVlZCB0byBoYXZlCj4gY29udGlndW91cwo+IMKgICrCoMKgwqDCoMKgwqAgRE1B
IGFkZHJlc3Nlcy4KPiDCoCAqIEB2YWRkcjoga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUg
YmFja2luZyBtZW1vcnkKPiAtICogQG1hcF9ub25jb2hlcmVudDogaWYgdHJ1ZSwgdGhlIEdFTSBv
YmplY3QgaXMgYmFja2VkIGJ5IG5vbi0KPiBjb2hlcmVudCBtZW1vcnkKPiArICogQGNhY2hlZDog
aWYgdHJ1ZSwgdGhlIEdFTSBvYmplY3QgaXMgYmFja2VkIGJ5IGNhY2hlZCBtZW1vcnkKPiArICog
QGNvaGVyZW50OiBUaGlzIG9wdGlvbiBvbmx5IG1lYW5pbmdmdWwgd2hlbiBhIEdFTSBvYmplY3Qg
aXMKPiBjYWNoZWQuCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJZiB0cnVlLCBTeW5jIHRo
ZSBHRU0gb2JqZWN0IGZvciBETUEgYWNjZXNzIGlzIG5vdAo+IHJlcXVpcmVkLgo+IMKgICovCj4g
wqBzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0IHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRy
bV9nZW1fb2JqZWN0IGJhc2U7Cj4gQEAgLTI2LDcgKzI4LDggQEAgc3RydWN0IGRybV9nZW1fZG1h
X29iamVjdCB7Cj4gwqDCoMKgwqDCoMKgwqDCoC8qIEZvciBvYmplY3RzIHdpdGggRE1BIG1lbW9y
eSBhbGxvY2F0ZWQgYnkgR0VNIERNQSAqLwo+IMKgwqDCoMKgwqDCoMKgwqB2b2lkICp2YWRkcjsK
PiDCoAo+IC3CoMKgwqDCoMKgwqDCoGJvb2wgbWFwX25vbmNvaGVyZW50Owo+ICvCoMKgwqDCoMKg
wqDCoGJvb2wgY2FjaGVkOwo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgY29oZXJlbnQ7Cj4gwqB9Owo+
IMKgCj4gwqAjZGVmaW5lIHRvX2RybV9nZW1fZG1hX29iaihnZW1fb2JqKSBcCgo=

