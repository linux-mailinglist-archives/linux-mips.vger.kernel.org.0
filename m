Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497AA33A4F0
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 14:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235448AbhCNNMT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 09:12:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:57629 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235341AbhCNNMS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 14 Mar 2021 09:12:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lLQXO-0007q5-02; Sun, 14 Mar 2021 14:12:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 81323C246C; Sun, 14 Mar 2021 14:10:37 +0100 (CET)
Date:   Sun, 14 Mar 2021 14:10:37 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wang Qing <wangqing@vivo.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: kernel: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <20210314131037.GC5165@alpha.franken.de>
References: <1615606429-2568-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615606429-2568-1-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 13, 2021 at 11:33:48AM +0800, Wang Qing wrote:
> debugfs_create_file_unsafe does not protect the fops handed to it
> against file removal. DEFINE_DEBUGFS_ATTRIBUTE makes the fops aware of
> the file lifetime and thus protects it against removal.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  arch/mips/kernel/spinlock_test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
