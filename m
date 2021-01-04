Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C262E93AD
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 11:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbhADKtI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 05:49:08 -0500
Received: from elvis.franken.de ([193.175.24.41]:57206 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727032AbhADKtH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 05:49:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kwNPU-0001xs-04; Mon, 04 Jan 2021 11:48:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9C4DEC0808; Mon,  4 Jan 2021 11:43:57 +0100 (CET)
Date:   Mon, 4 Jan 2021 11:43:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     siyanteng@loongson.cn
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: loongson64: smp.c: Fix block comment coding style
Message-ID: <20210104104357.GE4765@alpha.franken.de>
References: <20201222083700.3651527-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222083700.3651527-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 22, 2020 at 04:37:00PM +0800, siyanteng@loongson.cn wrote:
> From: siyanteng <siyanteng@loongson.cn>
> 
> This patch fixes:
> "WARNING: Block comments use a trailing */ on a separate line"
> by checkpatch.pl
> 
> Signed-off-by: siyanteng <siyanteng@loongson.cn>
> ---
>  arch/mips/loongson64/smp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
