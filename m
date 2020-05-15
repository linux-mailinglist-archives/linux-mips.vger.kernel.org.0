Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582581D473A
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgEOHj4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 03:39:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:54067 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726624AbgEOHj4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 03:39:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZUwf-0007Id-00; Fri, 15 May 2020 09:39:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3F748C04A0; Fri, 15 May 2020 09:39:38 +0200 (CEST)
Date:   Fri, 15 May 2020 09:39:38 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 2/2] MIPS: Fix build errors under
 CONFIG_HAVE_STD_PC_SERIAL_PORT
Message-ID: <20200515073938.GA8289@alpha.franken.de>
References: <1589512985-27419-1-git-send-email-yangtiezhu@loongson.cn>
 <1589512985-27419-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589512985-27419-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 15, 2020 at 11:23:05AM +0800, Tiezhu Yang wrote:
> When CONFIG_HAVE_STD_PC_SERIAL_PORT is set, include linux/module.h to fix
> the following build errors:

how are you doing this ? To me it looks like this CONFIG option isn't
used anymore.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
