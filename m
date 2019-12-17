Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003571221AA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 02:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfLQBsK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Dec 2019 20:48:10 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36628 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726016AbfLQBsK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Dec 2019 20:48:10 -0500
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Tue, 17 Dec 2019
 09:47:39 +0800 (GMT+08:00)
X-Originating-IP: [10.40.23.40]
Date:   Tue, 17 Dec 2019 09:47:39 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5a2Z5Zu95LqR?= <sunguoyun@loongson.cn>
To:     "Paul Burton" <paulburton@kernel.org>
Cc:     "Ralf Baechle" <ralf@linux-mips.org>,
        "James Hogan" <jhogan@kernel.org>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Christian Brauner" <christian.brauner@ubuntu.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Heiko Carstens" <heiko.carstens@de.ibm.com>,
        "David Howells" <dhowells@redhat.com>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Tiezhu Yang" <yangtiezhu@loongson.cn>,
        "Xuefeng Li" <lixuefeng@loongson.cn>
Subject: Re: Re: [PATCH V3] MIPS: Add get_thread_area syscall
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2019 www.mailtech.cn .loongson.cn
In-Reply-To: <20191216193333.up4qqzxno23pbzix@lantea.localdomain>
References: <1576462671-7226-1-git-send-email-sunguoyun@loongson.cn>
 <20191216193333.up4qqzxno23pbzix@lantea.localdomain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <11e30cd0.47dc.16f118a143d.Coremail.sunguoyun@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9Dxn9O8M_hdc7QLAA--.3923W
X-CM-SenderInfo: 5vxqw3hr1x0qxorr0wxvrqhubq/1tbiAQAHDV3QvLRf0QAAsA
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RGVhciBQYXVsLAoKVGhhbmsgeW91IHZlcnkgbXVjaC4KSSBkaWRuYHQga25vdyB0aGlzIHdheSBh
c20oInJkaHdyICUwLCAkMjkiIDogIj1yIigqcHRscykpIGJlZm9yZS5Ob3cgSSBoYXZlIGEgdGVz
dCBmb3IgaXQgYW5kIGl0IHJlYWx5IGNhbiB3b3JrIG5vcm1hbGx5LgpJIGp1c3QgZmluZCBnZXRf
dGhyZWFkX2FyZWEgc3lzY2FsbCBhdCBwYXRoIGFyY2gveDg2LnNvIEkgaGF2ZSBhIGltcGxlbWVu
dCBvbiBNSVBTIHBsYXRmb3JtLiBBbmQgSSB0aGluayBzZXRfdGhyZWFkX2FyZWEgYW5kIGdldF90
aHJlYWRfYXJlYSBpcyBtYXRjaGVkIGluIHBhaXJzLgpOb3cgaXQgc2VlbXMgdGhhdCB0aGUgZ2V0
X3RocmVhZF9hcmVhIHN5c2NhbGwgaXMgbm90IG5lY2Vzc2FyeSBmb3IgY3JpdS4KClRoYW5rcywK
ICAgIEd1b3l1biBTdW4KCiZndDsgLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQomZ3Q7IOWPkeS7tuS6
ujogIlBhdWwgQnVydG9uIiA8cGF1bGJ1cnRvbkBrZXJuZWwub3JnPgomZ3Q7IOWPkemAgeaXtumX
tDogMjAxOS0xMi0xNyAwMzozMzozMyAo5pif5pyf5LqMKQomZ3Q7IOaUtuS7tuS6ujogIkd1b3l1
biBTdW4iIDxzdW5ndW95dW5AbG9vbmdzb24uY24+CiZndDsg5oqE6YCBOiAiUmFsZiBCYWVjaGxl
IiA8cmFsZkBsaW51eC1taXBzLm9yZz4sICJKYW1lcyBIb2dhbiIgPGpob2dhbkBrZXJuZWwub3Jn
PiwgIlBldGVyIFppamxzdHJhIiA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+LCAiQ2hyaXN0aWFuIEJy
YXVuZXIiIDxjaHJpc3RpYW4uYnJhdW5lckB1YnVudHUuY29tPiwgIkFybmQgQmVyZ21hbm4iIDxh
cm5kQGFybmRiLmRlPiwgIkhlaWtvIENhcnN0ZW5zIiA8aGVpa28uY2Fyc3RlbnNAZGUuaWJtLmNv
bT4sICJEYXZpZCBIb3dlbGxzIiA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4sICJHZWVydCBVeXR0ZXJo
b2V2ZW4iIDxnZWVydEBsaW51eC1tNjhrLm9yZz4sICJDYXRhbGluIE1hcmluYXMiIDxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4sIGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnLCAiVGllemh1IFlhbmciIDx5YW5ndGllemh1QGxvb25nc29uLmNu
PiwgIlh1ZWZlbmcgTGkiIDxsaXh1ZWZlbmdAbG9vbmdzb24uY24+CiZndDsg5Li76aKYOiBSZTog
W1BBVENIIFYzXSBNSVBTOiBBZGQgZ2V0X3RocmVhZF9hcmVhIHN5c2NhbGwKJmd0OyAKJmd0OyBI
aSBHdW95dW4sCiZndDsgCiZndDsgT24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMTA6MTc6NTFBTSAr
MDgwMCwgR3VveXVuIFN1biB3cm90ZToKJmd0OyAmZ3Q7IENSSVUoaHR0cHM6Ly9jcml1Lm9yZy8p
IHRvb2xzIHdpbGwgZHVtcCBUTFMoVGhyZWFkIExvY2FsIFN0b3JhZ2UpIGJ5CiZndDsgJmd0OyBn
ZXRfdGhyZWFkX2FyZWEgZHVyaW5nIGNoZWNrcG9pbnQgYW5kIHJlc3RvcmUgVExTIGJ5IHNldF90
aHJlYWRfYXJlYSBkdXJpbmcKJmd0OyAmZ3Q7IHJlc3RvcmUuIHdpdGhvdXQgdGhpcyBzeXNjYWxs
LCBjcml1IHJlc3RvcmUgd2lsbCBmYWlsIG9uIE1JUFMgcGxhdGZvcm0KJmd0OyAmZ3Q7IGJlY2F1
c2UgYSB2YXJpYWJsZSB3aXRoIEdDQyBfX3RocmVhZCB3aWxsIGJlIGludmFsaWQuCiZndDsgJmd0
OyAKJmd0OyAmZ3Q7IFRoZSBmb2xsb3dpbmcgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgd2hlbiBj
cml1IHJlc3RvcmUKJmd0OyAmZ3Q7IAomZ3Q7ICZndDsgc3RhdGljIGlubGluZSB2b2lkIHJlc3Rv
cmVfdGxzKHRsc190ICpwdGxzKSB7CiZndDsgJmd0OyAgICAgICAgIGFzbSB2b2xhdGlsZSgKJmd0
OyAmZ3Q7ICAgICAgICAgICAgICAgICAgICAgICJtb3ZlICQ0LCAlMCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXG4iCiZndDsgJmd0OyAgICAgICAgICAgICAgICAgICAgICAibGkg
JDIsICAiX19zdHJpbmdpZnkoX19OUl9zZXRfdGhyZWFkX2FyZWEpIiAgXG4iCiZndDsgJmd0OyAg
ICAgICAgICAgICAgICAgICAgICAic3lzY2FsbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFxuIgomZ3Q7ICZndDsgICAgICAgICAgICAgICAgICAgICAgOgomZ3Q7ICZndDsg
ICAgICAgICAgICAgICAgICAgICAgOiAiciIoKnB0bHMpCiZndDsgJmd0OyAgICAgICAgICAgICAg
ICAgICAgICA6ICIkNCIsIiQyIiwibWVtb3J5Iik7CiZndDsgJmd0OyAKJmd0OyAmZ3Q7IHRoZSAq
cHRscyBjYW4gYmUgb2J0YWluZWQgYnkgZ2V0X3RocmVhZF9hcmVhIG9uIE1JUFMgcGxhdGZvcm0g
d2hlbiBjcml1CiZndDsgJmd0OyBjaGVja3BvaW50LiBqdXN0IGxpa2UgdGhpczoKJmd0OyAmZ3Q7
IAomZ3Q7ICZndDsgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZ2V0X3Rscyh0bHNfdCAqcHRscykK
Jmd0OyAmZ3Q7IHsKJmd0OyAmZ3Q7IAlhc20gdm9sYXRpbGUoCiZndDsgJmd0OyAJCSAgICAgIm1v
dmUgJDQsICUwCQkJCSAgICBcbiIKJmd0OyAmZ3Q7IAkJICAgICAibGkgJDIsICAiX19zdHJpbmdp
ZnkoX19OUl9nZXRfdGhyZWFkX2FyZWEpIiAgXG4iCiZndDsgJmd0OyAJCSAgICAgInN5c2NhbGwJ
CQkJCSAgICBcbiIKJmd0OyAmZ3Q7IAkJICAgICA6CiZndDsgJmd0OyAJCSAgICAgOiAiciIocHRs
cykKJmd0OyAmZ3Q7IAkJICAgICA6ICIkNCIsIiQyIiwibWVtb3J5Iik7CiZndDsgJmd0OyAKJmd0
OyAmZ3Q7IH0KJmd0OyAKJmd0OyBXaHkgd291bGQgeW91IG5lZWQgYSBzeXNjYWxsIGZvciB0aGlz
PwomZ3Q7IAomZ3Q7IFdoeSBub3QgcmV0cmlldmUgdGhlIHZhbHVlIHVzaW5nIHRoZSByZGh3ciBp
bnN0cnVjdGlvbiBqdXN0IGxpa2UgZXZlcnkKJmd0OyBvdGhlciBiaXQgb2YgY29kZSB1c2luZyB0
aHJlYWQtbG9jYWwgc3RvcmFnZSBkb2VzPwomZ3Q7IAomZ3Q7IGllLiBzb21ldGhpbmcgbGlrZToK
Jmd0OyAKJmd0OyBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9nZXRfdGxzKHRsc190ICpwdGxzKQom
Z3Q7IHsKJmd0OyAJYXNtKCJyZGh3ciAlMCwgJDI5IiA6ICI9ciIoKnB0bHMpKTsKJmd0OyB9CiZn
dDsgCiZndDsgVGhhbmtzLAomZ3Q7ICAgICBQYXVsCjwvbGl4dWVmZW5nQGxvb25nc29uLmNuPjwv
eWFuZ3RpZXpodUBsb29uZ3Nvbi5jbj48L2NhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPjwvZ2VlcnRA
bGludXgtbTY4ay5vcmc+PC9kaG93ZWxsc0ByZWRoYXQuY29tPjwvaGVpa28uY2Fyc3RlbnNAZGUu
aWJtLmNvbT48L2FybmRAYXJuZGIuZGU+PC9jaHJpc3RpYW4uYnJhdW5lckB1YnVudHUuY29tPjwv
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+PC9qaG9nYW5Aa2VybmVsLm9yZz48L3JhbGZAbGludXgtbWlw
cy5vcmc+PC9zdW5ndW95dW5AbG9vbmdzb24uY24+PC9wYXVsYnVydG9uQGtlcm5lbC5vcmc+
