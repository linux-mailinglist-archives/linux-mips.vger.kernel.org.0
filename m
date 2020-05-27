Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE431E40DF
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 13:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgE0LzM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 07:55:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:41117 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729451AbgE0LzK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 07:55:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdueJ-00019x-00; Wed, 27 May 2020 13:55:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2D3BEC0594; Wed, 27 May 2020 13:41:06 +0200 (CEST)
Date:   Wed, 27 May 2020 13:41:06 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] MIPS: head.S: Always jump to kernel_entry at head
 of text
Message-ID: <20200527114106.GA13965@alpha.franken.de>
References: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
 <20200527063438.391949-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527063438.391949-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 02:34:32PM +0800, Jiaxun Yang wrote:
> Buggy loaders like early version of PMON2000 sometimes ignore
> elf_entry and goto start of text directly.

so select BOOT_RAW on those broken platforms, no need for this change.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
