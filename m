Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8B63179B53
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 22:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgCDVzm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 16:55:42 -0500
Received: from elvis.franken.de ([193.175.24.41]:51174 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728926AbgCDVzm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Mar 2020 16:55:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1j9bzN-0000mm-00; Wed, 04 Mar 2020 22:55:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 832E3C0EF9; Wed,  4 Mar 2020 21:31:44 +0100 (CET)
Date:   Wed, 4 Mar 2020 21:31:44 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v3] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200304203144.GA4323@alpha.franken.de>
References: <20200304005549.5832-1-afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200304005549.5832-1-afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 04, 2020 at 06:25:43AM +0530, afzal mohammed wrote:
> Hi mips maintainers,
> 
> if okay w/ this change, please consider taking it thr' your tree, else please
> let me know.

sorry this doesn't even compile for the first platform I've tested:

In file included from /home/tbogendoerfer/wip/korg/linux/arch/mips/sni/reset.c:11:0:
/home/tbogendoerfer/wip/korg/linux/arch/mips/include/asm/sni.h:242:8: error: unknown type name ‘irqreturn_t’
 extern irqreturn_t sni_isa_irq_handler(int dummy, void *p);
        ~~~~~~~~~~~

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
