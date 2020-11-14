Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4D62B316F
	for <lists+linux-mips@lfdr.de>; Sun, 15 Nov 2020 00:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgKNXjw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Nov 2020 18:39:52 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:47957 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKNXjw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Nov 2020 18:39:52 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DB6511BF207;
        Sat, 14 Nov 2020 23:39:49 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        gregkh@linuxfoundation.org, chenhc@lemote.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH 0/2] Preserve goldfish rtc
Date:   Sun, 15 Nov 2020 00:39:49 +0100
Message-Id: <160539698681.853810.17947203861540621846.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 14 Nov 2020 21:09:19 +0800, Jiaxun Yang wrote:
> Cc: chenhc@lemote.com
> Cc: gregkh@linuxfoundation.org
> 
> Jiaxun Yang (2):
>   rtc: goldfish: Remove GOLDFISH dependency
>   MAINTAINERS: Set myself as Goldfish RTC maintainer
> 
> [...]

Applied, thanks!

[1/2] rtc: goldfish: Remove GOLDFISH dependency
      commit: 5022cfc112328e7fd489f5e3d41b7f352322880c
[2/2] MAINTAINERS: Set myself as Goldfish RTC maintainer
      commit: 9844484eac2bff09ba3fcdebcf5a41d94df6b6c1

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
