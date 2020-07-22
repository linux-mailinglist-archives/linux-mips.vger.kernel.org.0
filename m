Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BB02295A1
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 12:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVKFm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 06:05:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:45257 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgGVKFm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jul 2020 06:05:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jyBd6-0000tT-00; Wed, 22 Jul 2020 12:05:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3C902C0878; Wed, 22 Jul 2020 11:36:03 +0200 (CEST)
Date:   Wed, 22 Jul 2020 11:36:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Grant pte read permission, even if vma only have
 VM_WRITE permission.
Message-ID: <20200722093603.GA10090@alpha.franken.de>
References: <20200717095536.45011-1-liulichao@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717095536.45011-1-liulichao@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 17, 2020 at 05:55:36PM +0800, Lichao Liu wrote:
> If a page can be written, then it can definitely be read.

IMHO it's exactly the point of RIXI enabled CPUs to support a
writeonly mapping even if most of other archs aren't able to
support it. So if there is no real good reason to change this,
I'm going to leave it this way.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
