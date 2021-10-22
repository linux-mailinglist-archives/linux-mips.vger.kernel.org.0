Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DE3437A42
	for <lists+linux-mips@lfdr.de>; Fri, 22 Oct 2021 17:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhJVPs0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Oct 2021 11:48:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:33955 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233502AbhJVPsV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Oct 2021 11:48:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mdwk5-000485-00; Fri, 22 Oct 2021 17:46:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C0A6CC2618; Fri, 22 Oct 2021 17:45:44 +0200 (CEST)
Date:   Fri, 22 Oct 2021 17:45:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wang Haojun <jiangliuer01@gmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix build error for brcmstb_gisb
Message-ID: <20211022154544.GA11114@alpha.franken.de>
References: <20211022112708.962338-1-wanghaojun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022112708.962338-1-wanghaojun@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 22, 2021 at 07:27:08PM +0800, Wang Haojun wrote:
> The GISB bus error handler need board_be_handler, but this
> code cannot used it when BRCMSTB_GISB_ARB is a module.
> 
> ERROR: modpost: "board_be_handler" [drivers/bus/brcmstb_gisb.ko] undefined!

maybe I'm missing a patch but in mips-next tree

config BRCMSTB_GISB_ARB
        bool "Broadcom STB GISB bus arbiter"

this can't be a module...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
