Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D9713A05B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 05:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgANE7t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 23:59:49 -0500
Received: from forward100o.mail.yandex.net ([37.140.190.180]:36273 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbgANE7t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 23:59:49 -0500
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 721D34AC1143;
        Tue, 14 Jan 2020 07:59:46 +0300 (MSK)
Received: from mxback6q.mail.yandex.net (mxback6q.mail.yandex.net [IPv6:2a02:6b8:c0e:42:0:640:9de5:975f])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 6B5967F2001D;
        Tue, 14 Jan 2020 07:59:46 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback6q.mail.yandex.net (mxback/Yandex) with ESMTP id zJNr872U7L-xhv4HC7P;
        Tue, 14 Jan 2020 07:59:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578977985;
        bh=6Cyzs5wumIUEXhKYoOJBtaXB0/ZKou1qqhe1zk9UI/A=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=YzrR6SiP0oG1WQ7DbN37izmaJeR9CfEMOrJBYGGgufSSqp2hik1sQDF5Ar0y4AYkL
         buO45ByXcp6oGuJbsauXEBndI+R1ZXC1zXmuARLSqBEN90EkJUQdG7f1zu6+sTNGgD
         JCUzFyBjRkyeBLmg84auPPPHktSFSxCtG2DabCF4=
Authentication-Results: mxback6q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-0bfbe4c1c324.qloud-c.yandex.net with HTTP;
        Tue, 14 Jan 2020 07:59:43 +0300
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Envelope-From: yjx@flygoat.com
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "paul.burton@mips.com" <paul.burton@mips.com>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "syq@debian.org" <syq@debian.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "ebiederm@xmission.com" <ebiederm@xmission.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "ak@linux.intel.com" <ak@linux.intel.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "prasannatsmkumar@gmail.com" <prasannatsmkumar@gmail.com>,
        "sernia.zhou@foxmail.com" <sernia.zhou@foxmail.com>,
        "zhenwenjin@gmail.com" <zhenwenjin@gmail.com>
In-Reply-To: <1578933813-80122-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <Introduce SMP support for CI20 (based on JZ4780).>
         <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com> <1578933813-80122-5-git-send-email-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Tue, 14 Jan 2020 12:59:43 +0800
Message-Id: <30183031578977983@vla1-0bfbe4c1c324.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



14.01.2020, 00:44, "周琰杰 (Zhou Yanjie)" <zhouyanjie@wanyeetech.com>:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  .../bindings/mips/ingenic/ingenic,cpu.txt | 32 ++++++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,soc,txt | 18 ++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt
>

We'd better use schemas for the document.

See[1]

Thanks.

[1]: https://lwn.net/Articles/771621/
--
Jiaxun Yang
