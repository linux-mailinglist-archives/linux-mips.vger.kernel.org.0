Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9DCA46CB
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 04:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfIACmD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 22:42:03 -0400
Received: from smtpbgsg2.qq.com ([54.254.200.128]:41394 "EHLO smtpbgsg2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728575AbfIACmD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 22:42:03 -0400
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: grb4v7rasPX5KUcSrmYVq2J+UsEykQ+UA3zUaEnnfYcqOBtPL5WU8Oo35gv4X
        Ri6fRZId+v8m0iTFuZCSYAbons1+Ugpu3hZY2JnVKujro+SAAs6qz5llvkjYe7+IMjpLlL5
        7UWP/B+eWpJaOduip/X+omPzTkmOwP/XeNTCe6w8uvOCqdlBSyBmrmlEXLJv84+Dh/zJ0eQ
        FWyXLIUeybx/SnNfqltiu2LgZEFlFCYc9sONdAdYfdVoymRjHqDqfGC6c41G5w1WHpZ7Xi9
        JqPQ/vPyuh+WWh1E2lINhZFsMN7FFrPZc+4g==
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 49.75.85.93
X-QQ-STYLE: 
X-QQ-mid: bizmailfree7t1567305713t19521
From:   "=?utf-8?B?6ZmI5Y2O5omN?=" <chenhc@lemote.com>
To:     "=?utf-8?B?UGF1bCBCdXJ0b24=?=" <paul.burton@mips.com>,
        "=?utf-8?B?bGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc=?=" 
        <linux-mips@vger.kernel.org>
Cc:     "=?utf-8?B?UGF1bCBCdXJ0b24=?=" <pburton@wavecomp.com>
Subject: Re:[PATCH] MIPS: Drop Loongson _CACHE_* definitions
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Date:   Sun, 1 Sep 2019 10:41:53 +0800
X-Priority: 3
Message-ID: <tencent_136CE6EE297BEA5D2910DF5B@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20190831154145.7328-1-paul.burton@mips.com>
In-Reply-To: <20190831154145.7328-1-paul.burton@mips.com>
X-QQ-ReplyHash: 3456988592
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
        by smtp.qq.com (ESMTP) with SMTP
        id ; Sun, 01 Sep 2019 10:41:54 +0800 (CST)
Feedback-ID: bizmailfree:lemote.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGksIFBhdWwsDQoNCkkgZm91bmQgdGhhdCBfQ0FDSEVfQ0FDSEFCTEVfQ09IRVJFTlQgaXMg
cmVtb3ZlZCBzaW5jZSAzLjE4LCBzbyB0aGlzIHBhdGNoIG5lZWQgdG8gQ0Mgc3RhYmxlPw0K
DQpIdWFjYWkNCiANCi0tLS0tLS0tLS0tLS0tLS0tLSBPcmlnaW5hbCAtLS0tLS0tLS0tLS0t
LS0tLS0NCkZyb206ICAiUGF1bCBCdXJ0b24iPHBhdWwuYnVydG9uQG1pcHMuY29tPjsNCkRh
dGU6ICBTYXQsIEF1ZyAzMSwgMjAxOSAxMTo0MSBQTQ0KVG86ICAibGludXgtbWlwc0B2Z2Vy
Lmtlcm5lbC5vcmciPGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPjsNCkNjOiAgIlBhdWwg
QnVydG9uIjxwYnVydG9uQHdhdmVjb21wLmNvbT47ICJIdWFjYWkgQ2hlbiI8Y2hlbmhjQGxl
bW90ZS5jb20+Ow0KU3ViamVjdDogIFtQQVRDSF0gTUlQUzogRHJvcCBMb29uZ3NvbiBfQ0FD
SEVfKiBkZWZpbml0aW9ucw0KIA0KX0NBQ0hFX0NBQ0hBQkxFX05PTkNPSEVSRU5UIGlzIGRl
ZmluZWQgYXMgMzw8X0NBQ0hFX1NISUZUIGJ5IGRlZmF1bHQsIHNvDQp0aGVyZSdzIG5vIG5l
ZWQgdG8gZGVmaW5lIGl0IGFzIHN1Y2ggc3BlY2lmaWNhbGx5IGZvciBMb29uZ3Nvbi4NCg0K
X0NBQ0hFX0NBQ0hBQkxFX0NPSEVSRU5UIGlzIG5vdCB1c2VkIGFueXdoZXJlIGluIHRoZSBr
ZXJuZWwsIHNvIHRoZXJlJ3MNCm5vIG5lZWQgdG8gZGVmaW5lIGl0IGF0IGFsbC4NCg0KRmlu
YWxseSB0aGUgY29tbWVudCBmb3VuZCBhbG9uZ3NpZGUgdGhlc2UgZGVmaW5pdGlvbnMgc2Vl
bXMgaW5jb3JyZWN0IC0NCml0IHN1Z2dlc3RzIHRoYXQgd2UncmUgZGVmaW5pbmcgX0NBQ0hF
X0NBQ0hBQkxFX05PTkNPSEVSRU5UIHN1Y2ggdGhhdCBpdA0KYWN0dWFsbHkgcHJvdmlkZXMg
Y29oZXJlbmNlLCBidXQgdGhlIG9wcG9zaXRlIHNlZW1zIHRvIGJlIHRydWUgJiBpbnN0ZWFk
DQp0aGUgdW51c2VkIF9DQUNIRV9DQUNIQUJMRV9DT0hFUkVOVCBpcyBkZWZpbmVkIGFzIHRo
ZSB0eXBpY2FsbHkNCmluY29oZXJlbnQgdmFsdWUuDQoNCkRlbGV0ZSB0aGUgd2hvbGUgdGhp
bmcsIHdoaWNoIHdpbGwgaGF2ZSBubyBlZmZlY3Qgb24gdGhlIGNvbXBpbGVkIGNvZGUNCmFu
eXdheS4NCg0KU2lnbmVkLW9mZi1ieTogUGF1bCBCdXJ0b24gPHBhdWwuYnVydG9uQG1pcHMu
Y29tPg0KQ2M6IEh1YWNhaSBDaGVuIDxjaGVuaGNAbGVtb3RlLmNvbT4NCi0tLQ0KDQogYXJj
aC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oIHwgNyAtLS0tLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5j
bHVkZS9hc20vcGd0YWJsZS1iaXRzLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJs
ZS1iaXRzLmgNCmluZGV4IDVmMWNlZDhjYmEwNy4uNDA5YWUwMWVkN2JlIDEwMDY0NA0KLS0t
IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oDQorKysgYi9hcmNoL21p
cHMvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmgNCkBAIC0yMjEsMTMgKzIyMSw2IEBAIHN0
YXRpYyBpbmxpbmUgdWludDY0X3QgcHRlX3RvX2VudHJ5bG8odW5zaWduZWQgbG9uZyBwdGVf
dmFsKQ0KIA0KICNkZWZpbmUgX0NBQ0hFX0NBQ0hBQkxFX05PTkNPSEVSRU5UICg1PDxfQ0FD
SEVfU0hJRlQpDQogDQotI2VsaWYgZGVmaW5lZChDT05GSUdfQ1BVX0xPT05HU09OMykNCi0N
Ci0vKiBVc2luZyBDT0hFUkVOVCBmbGFnIGZvciBOT05DT0hFUkVOVCBkb2Vzbid0IGh1cnQu
ICovDQotDQotI2RlZmluZSBfQ0FDSEVfQ0FDSEFCTEVfTk9OQ09IRVJFTlQgKDM8PF9DQUNI
RV9TSElGVCkgIC8qIExPT05HU09OICAgICAgICovDQotI2RlZmluZSBfQ0FDSEVfQ0FDSEFC
TEVfQ09IRVJFTlQgICAgKDM8PF9DQUNIRV9TSElGVCkgIC8qIExPT05HU09OLTMgICAgICov
DQotDQogI2VsaWYgZGVmaW5lZChDT05GSUdfTUFDSF9JTkdFTklDKQ0KIA0KIC8qIEluZ2Vu
aWMgdXNlcyB0aGUgV0EgYml0IHRvIGFjaGlldmUgd3JpdGUtY29tYmluZSBtZW1vcnkgd3Jp
dGVzICovDQotLSANCjIuMjIuMQ==



