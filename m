Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569C955445D
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 10:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352295AbiFVHMl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 03:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235471AbiFVHMj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 03:12:39 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C5A5236E0A
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=iTJk0
        wbda2Ta7sh7Q8rUoPbuLiHbpckzTcj88wJ+aH0=; b=qCvy9O8cVERV8XuZnV7P4
        uuZuq7efccCTa3lZC5+kjY/qbO23Xx7lbjRag7ln2kKTFjB2csyWnxrHDZBUktq4
        J8kpObW656iWL6akMzd1eBxrPBhxmgRt2xxa+f1vPTUPFAN7X5d1zR6GgGzNiOLe
        sad4XBwoL8vY2nTDBfDcXU=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Wed, 22 Jun 2022 15:12:23 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Wed, 22 Jun 2022 15:12:23 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re:Re: [PATCH] mips/kernel: Add missing of_node_get()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAMuHMdUiZSqGY2xbosDBCxcvMej6ir8sDfuOk9qfXTzJPh6ZOw@mail.gmail.com>
References: <20220622060807.4095040-1-windhl@126.com>
 <CAMuHMdUiZSqGY2xbosDBCxcvMej6ir8sDfuOk9qfXTzJPh6ZOw@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1c4b317a.4aad.1818a41483c.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowADX3yfYwLJiqrE6AA--.27406W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QQoF1pEAQPtVgABsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CgpBdCAyMDIyLTA2LTIyIDE0OjU2OjMyLCAiR2VlcnQgVXl0dGVyaG9ldmVuIiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+IHdyb3RlOgo+SGkgTGlhbmcsCj4KPkNDIGRldmljZXRyZWUKPgo+T24gV2Vk
LCBKdW4gMjIsIDIwMjIgYXQgODowOCBBTSBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IHdyb3Rl
Ogo+PiBJbiBtaXBzX2NwY19kZWZhdWx0X3BoeXNfYmFzZSgpLCB3ZSBuZWVkIHRvIGFkZCBvZl9u
b2RlX2dldCgpIGJlZm9yZQo+PiBvZl9maW5kX2NvbXBhdGlibGVfbm9kZSgpIHdoaWNoIHdpbGwg
ZGVjcmVhc2UgdGhlIHJlZmNvdW50IG9mIGl0cwo+PiBmaXJzdCBhcmcuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4KPgo+VGhhbmtzIGZvciB5b3VyIHBhdGNo
IQo+Cj4+IC0tLSBhL2FyY2gvbWlwcy9rZXJuZWwvbWlwcy1jcGMuYwo+PiArKysgYi9hcmNoL21p
cHMva2VybmVsL21pcHMtY3BjLmMKPj4gQEAgLTI1LDYgKzI1LDcgQEAgcGh5c19hZGRyX3QgX193
ZWFrIG1pcHNfY3BjX2RlZmF1bHRfcGh5c19iYXNlKHZvaWQpCj4+ICAgICAgICAgc3RydWN0IHJl
c291cmNlIHJlczsKPj4gICAgICAgICBpbnQgZXJyOwo+Pgo+PiArICAgICAgIG9mX25vZGVfZ2V0
KG9mX3Jvb3QpOwo+Cj5BZGRpbmcgdGhpcyBsb29rcyBzdHJhbmdlIHRvIG1lLi4uCj4KCkhpLCB0
aGlzIGlzIGFsc28gc3RyYW5nZSB0byBtZS4KCkluIGZhY3QsIEkgYWxzbyBkb24ndCBsaWtlIGFk
ZCBhIHNwZWNpYWwgb2Zfbm9kZV9nZXQoKSBiZWZvcmUgSSBjYWxsIG9mX2ZpbmRfeHgoKSBlYWNo
IHRpbWUuCgpJbiBmYWN0LCBJIGhhdmUgbGVhcm5lZCB0aGlzIGVycm9yLXBhdHRlcm4gYmFzZWQg
b24gdGhlIGZvbGxvd2luZyBidWctZml4OgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjAwNzIwMTUyODA2LjQ0MzI2MjY0OEBsaW51eGZvdW5kYXRpb24ub3JnLwoKCj5Ib3dldmVyLCBv
Zl9maW5kX2NvbXBhdGlibGVfbm9kZSgpIGluZGVlZCBjYWxscyBvZl9ub2RlX3B1dChmcm9tKSwK
PnNvIHlvdXIgcGF0Y2ggaXMgY29ycmVjdC4KPgoKVGhhbmtzLgoKPkhvd2V2ZXIsIHdoZW4gcGFz
c2VkIE5VTEwgYXMgdGhlIGZyb20gcG9pbnRlciwgX19vZl9maW5kX2FsbF9ub2RlcygpCj4oZXhw
YW5kZWQgZnJvbSBmb3JfZWFjaF9vZl9hbGxub2Rlc19mcm9tKCkpIHR1cm5zIHRoaXMgaW50byBv
Zl9yb290Lgo+QXMgb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoKSBzdGlsbCBoYXMgdGhlIG9yaWdp
bmFsIChOVUxMKSBmcm9tCj5wb2ludGVyLCBvZl9ub2RlX3B1dChmcm9tKSBiZWNvbWVzIGEgbm8t
b3AuCj4KPj4gICAgICAgICBjcGNfbm9kZSA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKG9mX3Jv
b3QsIE5VTEwsICJtdGksbWlwcy1jcGMiKTsKPgo+SGVuY2UgSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gY2hhbmdlIHRoZSBhYm92ZSB0bwo+Cj4gICAgY3BjX25vZGUgPSBvZl9maW5kX2Nv
bXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAibXRpLG1pcHMtY3BjIik7Cj4KPmluc3RlYWQsIGku
ZS4gZ2V0IHJpZCBvZiB0aGUgZXhwbGljaXQgb2Zfcm9vdCBoYW5kbGluZz8KPgo+PiAgICAgICAg
IGlmIChjcGNfbm9kZSkgewo+PiAgICAgICAgICAgICAgICAgZXJyID0gb2ZfYWRkcmVzc190b19y
ZXNvdXJjZShjcGNfbm9kZSwgMCwgJnJlcyk7Cj4KCgpTb3JyeSwgR2VlcnQuCgpBcyBJIGRvbid0
IGtub3cgYW55b3RoZXIgZGV0YWlscyBvZiB0aGUgY29kZSBleGNlcHQgdGhlIGVycm9yLXBhdHRl
cm4gY29kZSwKSSBjYW5ub3QgZG8gYW55b3RoZXIgKG1vcmUgZWZmaWNpZW50KSBjaGFuZ2VzLgoK
SWYgaXQgaXMgYSBidWcsIHBsZWFzZSBmaXggaXQgaW4geW91ciBwcm9mZXNzaW9uYWwgd2F5IGlm
IG15IHBhdGNoIGlzIG5vdCBzbyB3ZWxsLgoKVGhhbmtzLgoKTGlhbmcuCgo+R3J7b2V0amUsZWV0
aW5nfXMsCj4KPiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KPi0tCj5HZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCj4KPkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
