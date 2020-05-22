Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236E01DE61E
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 14:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgEVMGE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 08:06:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52344 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728413AbgEVMGE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 08:06:04 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Fri, 22 May 2020
 20:06:01 +0800 (GMT+08:00)
X-Originating-IP: [106.39.149.52]
Date:   Fri, 22 May 2020 20:06:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5q+b56Kn5rOi?= <maobibo@loongson.cn>
To:     "WANG Xuerui" <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2020 www.mailtech.cn .loongson.cn
In-Reply-To: <20200521181403.6078-1-git@xen0n.name>
References: <20200521181403.6078-1-git@xen0n.name>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9AxVuopwMdeJdc3AA--.15234W
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/1tbiAQAECV3QvLuL4QACsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

U29ycnkgZm9yIGxhdGUgcmVwb25zZS4KSSBqdXN0IHdhbnQgdG8ga25vdyBob3cgdG8gc29sdmUg
Y29tcGF0aWJpbGl0eSBvbiBvbGRlciBrZXJuZWwuCkl0IGlzIG9rIHRvIHJ1biB1c2VyIGFwcGxp
Y2F0aW9uIHdpdGggY3B1Y2ZnIGluc3RyIG9uIG5ldyBrZXJuZWwgd2l0aCB0aGlzCnBhdGNoLCBo
b3dldmVyIHdoYXQgaWYgdGhlIGFwcGxpY2F0aW9uIGlzIHJ1bm5pbmcgb24gb2xkZXIga2VybmVs
IHdpdGhvdXQKY3B1Y2ZnIHNpbXVsYXRpb24/CgpyZWdhcmRzCmJpYm8sbWFvCgomZ3Q7IC0tLS0t
5Y6f5aeL6YKu5Lu2LS0tLS0KJmd0OyDlj5Hku7bkuro6ICJXQU5HIFh1ZXJ1aSIgPGdpdEB4ZW4w
bi5uYW1lPgomZ3Q7IOWPkemAgeaXtumXtDogMjAyMC0wNS0yMiAwMjoxNDowMiAo5pif5pyf5LqU
KQomZ3Q7IOaUtuS7tuS6ujogbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmcKJmd0OyDmioTpgIE6
ICJXQU5HIFh1ZXJ1aSIgPGdpdEB4ZW4wbi5uYW1lPgomZ3Q7IOS4u+mimDogW1BBVENIIHYzIDAv
MV0gQ1BVQ0ZHIGVtdWxhdGlvbiBvbiBvbGRlciBMb29uZ3NvbjY0IGNvcmVzCiZndDsgCiZndDsg
VGhpcyBwYXRjaCBicmluZ3MgdGhlIENQVUNGRyBpbnN0cnVjdGlvbiB0byBvbGRlciBMb29uZ3Nv
bjY0IGNvcmVzLAomZ3Q7IGVuYWJsaW5nIGEgdW5pZmllZCB3YXkgdG8gcXVlcnkgcHJvY2Vzc29y
IGNoYXJhY3RlcmlzdGljcyBvbiBMb29uZ3NvbjY0CiZndDsgc3lzdGVtcy4gUHJldmlvdXMgcXVl
c3Rpb24gb2YgaG93IHRvIGJlc3QgaW50ZWdyYXRlIG1hY2h0eXBlLXNwZWNpZmljCiZndDsgYW5k
IG1hY2h0eXBlLWFnbm9zdGljIGNwdSBwcm9iZSBsb2dpYyBpcyByZXNvbHZlZC4gKHRoYW5rcyBU
aG9tYXMgZm9yCiZndDsgcmV2aWV3aW5nISkKJmd0OyAKJmd0OyBUZXN0ZWQgb24gTG9vbmdzb24t
M0EzMDAwLgomZ3Q7IAomZ3Q7IEFsc28sIHRvIGFpZCB1c2Vyc3BhY2UgaW4gZGV0ZXJtaW5pbmcg
Q1BVQ0ZHIGF2YWlsYWJpbGl0eSB3aXRob3V0IGhhdmluZwomZ3Q7IHRvIGhhbmRsZSBTSUdJTEwg
b3IgcGFyc2UgL3Byb2MvY3B1aW5mbywgYSBuZXcgSFdDQVAgZmxhZyBpcyB0byBiZSBhZGRlZAom
Z3Q7IGluIGEgbGF0ZXIgcGF0Y2guIEkgYW0gd2FpdGluZyBmb3IgY29uc2Vuc3VzIGJlZm9yZSBp
bXBsZW1lbnRpbmcgdGhpcywKJmd0OyBhcyBpdCB3b3VsZCBiZSBwYXJ0IG9mIHVzZXJzcGFjZSBB
QkkuCiZndDsgCiZndDsgdjM6CiZndDsgLSBGaXhlZCBidWlsZCBvbiAhQ09ORklHX01BQ0hfTE9P
TkdTT042NAomZ3Q7IC0gUmVmYWN0b3JlZCB0byBtaW5pbWl6ZSBpbnRydXNpb24gdG8gbWFjaHR5
cGUtYWdub3N0aWMgY3B1IHByb2JlIGxvZ2ljCiZndDsgLSBNaW5vciB0d2Vha3MgdG8gY29tbWVu
dCBhbmQgS2NvbmZpZyB3b3JkaW5nCiZndDsgLSBEcm9wcGVkIFJldmlld2VkLWJ5IGFuZCBUZXN0
ZWQtYnkgZnJvbSBKaWF4dW4gYXMgdGhlIGNvZGUgaXMKJmd0OyAgIHJlZmFjdG9yZWQgc2lnbmlm
aWNhbnRseQomZ3Q7IAomZ3Q7IHYyOgomZ3Q7IC0gRml4ZWQgb25lIG1vcmUgdHlwbyBpbiBsb29u
Z3Nvbl9yZWdzLmgKJmd0OyAtIE1lcmdlZCBzaW11bGF0ZV9sb29uZ3NvbjNfY3NyIGFuZCBzaW11
bGF0ZV9sb29uZ3NvbjNfY3NyX2NwdWNmZyBpbnRvCiZndDsgICBvbmUgKHNpbXVsYXRlX2xvb25n
c29uM19jcHVjZmcpLCBwZXIgSHVhY2FpJ3Mgc3VnZ2VzdGlvbgomZ3Q7IAomZ3Q7IFdBTkcgWHVl
cnVpICgxKToKJmd0OyAgIE1JUFM6IGVtdWxhdGUgQ1BVQ0ZHIGluc3RydWN0aW9uIG9uIG9sZGVy
IExvb25nc29uNjQgY29yZXMKJmd0OyAKJmd0OyAgYXJjaC9taXBzL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEyICsKJmd0OyAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Nw
dS1pbmZvLmggICAgICAgICAgICAgIHwgICA5ICsKJmd0OyAgLi4uL2luY2x1ZGUvYXNtL21hY2gt
bG9vbmdzb242NC9jcHVjZmctZW11bC5oIHwgIDY1ICsrKysrKwomZ3Q7ICBhcmNoL21pcHMva2Vy
bmVsL2NwdS1wcm9iZS5jICAgICAgICAgICAgICAgICAgfCAgIDkgKwomZ3Q7ICBhcmNoL21pcHMv
a2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNDUgKysrKwomZ3Q7ICBhcmNo
L21pcHMvbG9vbmdzb242NC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKwomZ3Q7ICBh
cmNoL21pcHMvbG9vbmdzb242NC9jcHVjZmctZW11bC5jICAgICAgICAgICAgfCAyMTcgKysrKysr
KysrKysrKysrKysrCiZndDsgIDcgZmlsZXMgY2hhbmdlZCwgMzU4IGluc2VydGlvbnMoKykKJmd0
OyAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNoLWxvb25nc29u
NjQvY3B1Y2ZnLWVtdWwuaAomZ3Q7ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9taXBzL2xvb25n
c29uNjQvY3B1Y2ZnLWVtdWwuYwomZ3Q7IAomZ3Q7IC0tIAomZ3Q7IDIuMjEuMAo8L2dpdEB4ZW4w
bi5uYW1lPjwvZ2l0QHhlbjBuLm5hbWU+
