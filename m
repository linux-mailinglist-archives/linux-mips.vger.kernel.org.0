Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB049182240
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 20:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730913AbgCKT1u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 15:27:50 -0400
Received: from elvis.franken.de ([193.175.24.41]:34845 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730705AbgCKT1u (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 15:27:50 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jC713-0008JO-02; Wed, 11 Mar 2020 20:27:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 06771C1038; Wed, 11 Mar 2020 20:20:50 +0100 (CET)
Date:   Wed, 11 Mar 2020 20:20:49 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joe Perches <joe@perches.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH -next 004/491] PERFORMANCE EVENTS SUBSYSTEM: Use
 fallthrough;
Message-ID: <20200311192049.GC3588@alpha.franken.de>
References: <cover.1583896344.git.joe@perches.com>
 <73d22360c5c665fd7f480a209ae46807dfb07bbe.1583896348.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d22360c5c665fd7f480a209ae46807dfb07bbe.1583896348.git.joe@perches.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 10, 2020 at 09:51:18PM -0700, Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
> 
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
