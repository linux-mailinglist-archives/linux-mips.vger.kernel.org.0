Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2B41E38AE
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 07:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgE0F64 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 01:58:56 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34400 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0F64 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 01:58:56 -0400
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:496:b320::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 5503520C78;
        Wed, 27 May 2020 05:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590559136; bh=xmrzRgTaPu+Lded0OAqPkHg+RUsIhaAI2se0sq6Oeb8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RQi367IXbofrFGL7nBL1LxKS667Z57Zt8XkRNWGNqeiplhwGSO3KoEl3Iunz5o+/d
         zxqa15+jPYuNu05pZ+8C0dEV0Pk/lzJv3p80ltvqmulje1MzC+Xj4zV/uAIZNaBknW
         BPoLwGv5XeK+Bab6AK+Gs1DyXgF7tUOAgpvVKUeKLMj6IoIUnMm+X5YQjG0oodD4f5
         pCyXSQVSJgpAYdAbjIKoNCVHII/cN+Z8ImU08U9JvXk78wAwPOd8ZGsmki+LWSPFk8
         3GqbFS6WHZYEAfT0v+sfT75u0WlQZe1G/MZ7D6dZiUWUMgOof5s5gwM/5iZ5uJCjxl
         m30lAGaZ8Ac9w==
Date:   Wed, 27 May 2020 13:58:47 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Bugy bootloader woraround
Message-ID: <20200527135847.544ae588@halation.net.flygoat.com>
In-Reply-To: <20200527052721.366704-1-jiaxun.yang@flygoat.com>
References: <20200527052721.366704-1-jiaxun.yang@flygoat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 May 2020 13:27:17 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> Jiaxun Yang (2):
>   MIPS: head.S: Always jump to kernel_entry at head of text
>   MIPS: Loongso64: select NO_EXCEPT_FILL

Please ignore the noise.....
Something went wrong with my keyboard...

> 
>  arch/mips/Kconfig       | 1 +
>  arch/mips/kernel/head.S | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

