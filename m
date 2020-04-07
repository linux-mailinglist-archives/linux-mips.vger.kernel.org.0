Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BED61A0971
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 10:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgDGIkx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 04:40:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:56924 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbgDGIkx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Apr 2020 04:40:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jLjml-000722-00; Tue, 07 Apr 2020 10:40:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6325EC021C; Tue,  7 Apr 2020 10:40:34 +0200 (CEST)
Date:   Tue, 7 Apr 2020 10:40:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     maobibo <maobibo@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
Message-ID: <20200407084034.GA5688@alpha.franken.de>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
 <6be02099-4cbe-078b-4b2a-a80d3ed6237a@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be02099-4cbe-078b-4b2a-a80d3ed6237a@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 01, 2020 at 05:03:40PM +0800, maobibo wrote:
> how about adding dir arch/mips/include/asm/loongson64/mach and add
> common header files on it, headers with platform itself keep unchanged?
> By so, the patch size will be smaller like this.
> 
> 
> Thomas,
> what is your option?

that looks much nicer. There is the config option HAVE_MACH_HEAD_FILES,
which looks unused in your new patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
