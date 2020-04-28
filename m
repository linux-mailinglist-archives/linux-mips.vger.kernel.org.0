Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FE21BBC7E
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 13:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgD1LeT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 07:34:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:58686 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgD1LeT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 07:34:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTOV6-0004MF-03; Tue, 28 Apr 2020 13:34:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 33224C0344; Tue, 28 Apr 2020 13:33:26 +0200 (CEST)
Date:   Tue, 28 Apr 2020 13:33:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, john.garry@huawei.com,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] MIPS: Massage address spaces headers
Message-ID: <20200428113326.GD11443@alpha.franken.de>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
 <20200428021437.2000066-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428021437.2000066-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 28, 2020 at 10:14:12AM +0800, Jiaxun Yang wrote:
> That would allow us modify kernel vm address spaces without
> step into the hell of includes.
> 
> Also use some marcos for address spaces to make spaces.h more
> clear.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I don't like this patch as I can't see a good reason for shuffling
stuff arround. Can you drop this from this series ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
