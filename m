Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D56ECA4749
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 06:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbfIAEpg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 00:45:36 -0400
Received: from smtpbgeu1.qq.com ([52.59.177.22]:37279 "EHLO smtpbgeu1.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbfIAEpg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 1 Sep 2019 00:45:36 -0400
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: s7pJguWOSDCFtp1JH8fTQSemUIYps3R5hyTjD05zan7CbvfWkX5KuwTh00TZE
        yo4CtcRjROT+wQ0dI70Eg+Z06HiZ6qDSDkunPkFYFQP96sOLBF/9k9caQkUOUBvUMoHkiBN
        dGdbHJuwtLNo40FJOZ1+VPGf8AypbVJ0cEofMlSHsLzLy3xHmYU/XuDQ1ka356kYPvONPJa
        s3F6tPDrX8BfsxgLYqaOyQz6IMwqHIHnXHWADJLx0HrjDsOUeTel5ykdNw53N5Kgs1BfdZN
        kihsi7toq06FsgKfsyMUChHdLeFXZdf4+A+A==
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 49.75.85.93
X-QQ-STYLE: 
X-QQ-mid: bizmailfree7t1567313128t38778
From:   "=?utf-8?B?6ZmI5Y2O5omN?=" <chenhc@lemote.com>
To:     "=?utf-8?B?UGV0ZXIgWmlqbHN0cmE=?=" <peterz@infradead.org>,
        "=?utf-8?B?aHVhbmdwZWk=?=" <huangpei@loongson.cn>
Cc:     "=?utf-8?B?cmFsZg==?=" <ralf@linux-mips.org>,
        "=?utf-8?B?cGF1bC5idXJ0b24=?=" <paul.burton@mips.com>,
        "=?utf-8?B?amhvZ2Fu?=" <jhogan@kernel.org>,
        "=?utf-8?B?amlheHVuLnlhbmc=?=" <jiaxun.yang@flygoat.com>,
        "=?utf-8?B?bGludXgtbWlwcw==?=" <linux-mips@vger.kernel.org>
Subject: Something about loongson_llsc_mb
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Date:   Sun, 1 Sep 2019 12:45:28 +0800
X-Priority: 3
Message-ID: <tencent_34DDA31F622119EE5003B7F4@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
        <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
        <20190831085539.GG2369@hirez.programming.kicks-ass.net>
        <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
        <20190831161247.GM2369@hirez.programming.kicks-ass.net>
In-Reply-To: <20190831161247.GM2369@hirez.programming.kicks-ass.net>
X-QQ-ReplyHash: 2978775033
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
        by smtp.qq.com (ESMTP) with SMTP
        id ; Sun, 01 Sep 2019 12:45:30 +0800 (CST)
Feedback-ID: bizmailfree:lemote.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGksIFBldGVyLA0KDQpJIGZvdW5kIHRoYXQgdGhpcyBwYXRjaCBoYXMgYmVlbiBtZXJnZWQg
YnV0IEkgaGF2ZW4ndCByZWNlaXZlZCB0aGUgZS1tYWlsIGZvciBzb21lIHVua25vd24gcmVh
c29ucy4NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L21pcHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MWM2YzFjYTMxODU4NWYxMDk2ZDRkMDRiYzcy
MjI5N2M4NWU5ZmI4YQ0KDQpGaXJzdGx5LCB5b3VyIGNvbW1lbnRzIGFyZSBjb3JyZWN0LCBz
byB0aGUgYmFycmllci5oIHBhcnQgaXMgcGVyZmVjdC4NCg0KU2Vjb25kbHksIG1vc3Qgb2Yg
dGhlIHJlc3QgaXMgdXNlbGVzcywgYmVjYXVzZSBzbXBfbWJfX2JlZm9yZV9sbHNjLCBsb29u
Z3Nvbl9sbHNjX21iIGFuZCBvdGhlciBtZW1vcnkgYmFycmllcnMgYXJlIHRoZSBzYW1lIHRo
aW5nIG9uIExvb25nc29uLTMuIFdlIGRvbid0IG5lZWQgdG8gYWRkIGxvb25nc29uX2xsc2Nf
bWIgaWYgdGhlcmUgaXMgYWxyZWFkeSBhIHNtcF9tYl9fYmVmb3JlX2xsc2MuDQoNClRoaXJk
bHksIG1heWJlIHRoZSBvbmx5IGV4Y2VwdGlvbiBpcyBzeXNjYWxsLmMsIGJ1dCBtaXBzX2F0
b21pY19zZXQgaXMgbm90IHVzZWQgb24gTG9vbmdzb24tMy4gQW5kIGlmIGluIHNvbWUgY2Fz
ZXMgd2UgdXNlIGl0LCBJIHRoaW5rIHRoZSB1c2VyLXRvLWtlcm5lbCBjb250ZXh0IHN3aXRj
aCBoYXMgdGhlIHNhbWUgZWZmZWN0IG9mIGEgbWVtb3J5IGJhcnJpZXIuDQoNCkxhc3RseSwg
SSB0aGluayB0aGUgcmVhbCBleGNlcHRpb24gaXMgdGVzdF9hbmRfc2V0X2JpdF9sb2NrLCBp
dCBuZWVkIGEgbG9vbmdzb25fbGxzY19tYi4NCg0KSHVhY2Fp



