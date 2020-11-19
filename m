Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCC92B92C7
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 13:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgKSMsZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 07:48:25 -0500
Received: from elvis.franken.de ([193.175.24.41]:43147 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgKSMsZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 07:48:25 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kfjK0-0004vb-01; Thu, 19 Nov 2020 13:45:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 74374C020B; Thu, 19 Nov 2020 13:45:44 +0100 (CET)
Date:   Thu, 19 Nov 2020 13:45:44 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] MIPS: KASLR: Make relocation_address can be
 configured
Message-ID: <20201119124544.GB4936@alpha.franken.de>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
 <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 19, 2020 at 10:29:14AM +0800, Jinyang He wrote:
> When CONFIG_RANDOMIZE_BASE is not set, determine_relocation_address()
> always returns a constant. It is not friendly to users if the address
> cannot be used. Make it can be configured at Kconfig.

and how do I get the information which address I need to enter ?
This looks more like platforms need to supply a working address and
not the user configuring the kernel...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
