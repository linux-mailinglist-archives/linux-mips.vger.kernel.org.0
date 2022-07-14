Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F39D574F78
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 15:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbiGNNnT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 09:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbiGNNnS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 09:43:18 -0400
X-Greylist: delayed 1811 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Jul 2022 06:43:14 PDT
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 75A7160682
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=IUba6
        aaLMotz8Rezt+44pHbMNxmOG/cOfwNYf53AFq8=; b=S0nZJISqtLHN6aJq8RuqU
        shAteDdoRouMP0OgIGx+DqAgIq/qMIC30yJ3lqceywdTJDY17wzykm+J3WWFvZI2
        gnHqSBPIZYgIk1VyB6GsVi5OPULloDpB0ilgS+aF9MGJdnaG+TylJwXiu/11p6nL
        WmQ6COGiRA6YJUFWUEcHns=
Received: from sohu0106$126.com ( [218.247.43.97] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 14 Jul 2022 21:12:38 +0800 (CST)
X-Originating-IP: [218.247.43.97]
Date:   Thu, 14 Jul 2022 21:12:38 +0800 (CST)
From:   sohu0106 <sohu0106@126.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, security@kernel.org
Subject: buffer overflow in vpe_write() function of arch/mips/kernel/vpe.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <71b5d25.71d1.181fcd701cf.Coremail.sohu0106@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAAXJiZHFtBi+mlIAA--.5104W
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/1tbi7Qc+HlpEAZeXQgAAsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CkluIHRoZSB2cGVfd3JpdGUgZnVuY3Rpb24gb2YgYXJjaC9taXBzL2tlcm5lbC92cGUuYywgcGFy
YW1ldGVyICJzaXplX3QgY291bnQiIGlzIHBhc3MgYnkgdXNlcmxhbmQsIGlmICJjb3VudCIgaXMg
dmVyeSBsYXJnZSwgaXQgd2lsbCBieXBhc3MgdGhlIGNoZWNrIG9mICJpZiAoKGNvdW50ICsgdi0+
bGVuKSA+IHYtPnBsZW4pIi4oc3VjaCBhcyBjb3VudD0weGZmZmZmZmZmZmZmZmZmZmYpLiBUaGVu
IGl0IHdpbGwgbGVhZCB0byBidWZmZXIgb3ZlcmZsb3cgaW4gImNvcHlfZnJvbV91c2VyKHYtPnBi
dWZmZXIgKyB2LT5sZW4sIGJ1ZmZlciwgY291bnQpIi4KCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBz
L2tlcm5lbC92cGUuY19vcmcgYi9hcmNoL21pcHMva2VybmVsL3ZwZS5jCmluZGV4IGQwZDgzMmEu
LmJkMWY4MjYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9rZXJuZWwvdnBlLmNfb3JnCisrKyBiL2Fy
Y2gvbWlwcy9rZXJuZWwvdnBlLmMKQEAgLTg3MSw3ICs4NzEsNyBAQCBzdGF0aWMgc3NpemVfdCB2
cGVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvICBuc3QgY2hhciBfX3VzZXIgKmJ1ZmZlciwK
ICAgICAgICBpZiAodiA9PSBOVUxMKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cgot
ICAgICAgIGlmICgoY291bnQgKyB2LT5sZW4pID4gdi0+cGxlbikgeworICAgICAgIGlmICgoY291
bnQgKyB2LT5sZW4pID4gdi0+cGxlbiB8fCBjb3VudCArIHYtPmxlbiA+IHYtPmxlbikgICB7CiAg
ICAgICAgICAgICAgICBwcl93YXJuKCJWUEUgbG9hZGVyOiBlbGYgc2l6ZSB0b28gYmlnLiBQZXJo
YXBzIHN0ciAgaXAgdW5uZWVkZWQgc3ltYm9sc1xuIik7CiAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKICAgICAgICB9Cgo=
