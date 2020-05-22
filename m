Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5220C1DE88F
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 16:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbgEVOOI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 10:14:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37872 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729399AbgEVOOI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 10:14:08 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Fri, 22 May 2020
 22:14:02 +0800 (GMT+08:00)
X-Originating-IP: [106.39.149.52]
Date:   Fri, 22 May 2020 22:14:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5q+b56Kn5rOi?= <maobibo@loongson.cn>
To:     jiaxun.yang@flygoat.com
Cc:     "WANG Xuerui" <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: Re: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2020 www.mailtech.cn .loongson.cn
In-Reply-To: <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com>
References: <20200521181403.6078-1-git@xen0n.name>
 <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
 <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <42b4126b.f787.1723cbbd44e.Coremail.maobibo@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9Dxv2or3sde7t83AA--.11697W
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/1tbiAQAECV3QvLuMoAABsr
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CgoKJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCiZndDsg5Y+R5Lu25Lq6OiAiSmlheHVuIFlh
bmciIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjAtMDUt
MjIgMjA6NTc6MzMgKOaYn+acn+S6lCkKJmd0OyDmlLbku7bkuro6ICLmr5vnoqfms6IiIDxtYW9i
aWJvQGxvb25nc29uLmNuPiwgIldBTkcgWHVlcnVpIiA8Z2l0QHhlbjBuLm5hbWU+CiZndDsg5oqE
6YCBOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwomZ3Q7IOS4u+mimDogUmU6IFtQQVRDSCB2
MyAwLzFdIENQVUNGRyBlbXVsYXRpb24gb24gb2xkZXIgTG9vbmdzb242NCBjb3JlcwomZ3Q7IAom
Z3Q7IAomZ3Q7IAomZ3Q7IOS6jiAyMDIw5bm0NeaciDIy5pelIEdNVCswODowMCDkuIvljYg4OjA2
OjAxLCAi5q+b56Kn5rOiIiA8bWFvYmlib0Bsb29uZ3Nvbi5jbj4g5YaZ5YiwOgomZ3Q7ICZndDtT
b3JyeSBmb3IgbGF0ZSByZXBvbnNlLgomZ3Q7ICZndDtJIGp1c3Qgd2FudCB0byBrbm93IGhvdyB0
byBzb2x2ZSBjb21wYXRpYmlsaXR5IG9uIG9sZGVyIGtlcm5lbC4KJmd0OyAmZ3Q7SXQgaXMgb2sg
dG8gcnVuIHVzZXIgYXBwbGljYXRpb24gd2l0aCBjcHVjZmcgaW5zdHIgb24gbmV3IGtlcm5lbCB3
aXRoIHRoaXMKJmd0OyAmZ3Q7cGF0Y2gsIGhvd2V2ZXIgd2hhdCBpZiB0aGUgYXBwbGljYXRpb24g
aXMgcnVubmluZyBvbiBvbGRlciBrZXJuZWwgd2l0aG91dAomZ3Q7ICZndDtjcHVjZmcgc2ltdWxh
dGlvbj8KJmd0OyAKJmd0OyBBcHBsaWNhdGlvbiBjYW4gZmlyc3RseSBwcm9iZSBpZiBDUFVDRkcg
aXMgc3VwcG9ydGVkIGJ5IGtlcm5lbCAmYW1wOyBoYXJkd2FyZQomZ3Q7IGJ5IGZvcmsgYSB0aHJl
YWQgYW5kIGNhdGNoIFNJR0lMTCBzaWduYWwgb3IgSFdDQVAuCiZndDsgVGhlbiBkZWNpZGUgdXNl
IGxlZ2FjeSBtZXRob2RzIG9yIENQVUNGRyB0byBwcm9iZSBvdGhlciBmZWF0dXJlcy4KJmd0OyAK
Jmd0OyBTaW1pbGFyIG1ldGhvZCBoYXZlIGJlZW4gcHJvb2ZlZCBvbiBBcm0uClN1cmUsIGlmICB0
aGF0IHdvcmtzLCB3aGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2g/IERvIHdlIG5lZWQg
Y3B1Y2ZnCnNpbXVsYXRpb24gb24gb2xkZXIgbWFjaGluZSBzaW5jZSB0aGVyZSBpcyBwcm9wZXIg
bWV0aG9kIGFscmVhZHk/CgoKJmd0OyAtLSAKJmd0OyBKaWF4dW4gWWFuZwo8L21hb2JpYm9AbG9v
bmdzb24uY24+PC9naXRAeGVuMG4ubmFtZT48L21hb2JpYm9AbG9vbmdzb24uY24+PC9qaWF4dW4u
eWFuZ0BmbHlnb2F0LmNvbT4=
