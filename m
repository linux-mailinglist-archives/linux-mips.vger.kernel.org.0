Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AB61B055F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgDTJQw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:16:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:48049 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgDTJQv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 05:16:51 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jQSXh-00019d-00; Mon, 20 Apr 2020 11:16:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AAFE5C0181; Mon, 20 Apr 2020 11:07:26 +0200 (CEST)
Date:   Mon, 20 Apr 2020 11:07:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] Loongson64: RS780E clean-ups
Message-ID: <20200420090726.GA9388@alpha.franken.de>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 20, 2020 at 03:33:35PM +0800, Jiaxun Yang wrote:
> Basically ensure all RS780E stuff is enabled by DeviceTree.
> So I can post LS7A support later on.
> 
> Hi Thomas, could you please pick them into MIPS tree?

well, first patch doesn't apply, because it relies on your PCI patch
series. I've fixed this while applying and then faced

arch/mips/loongson64/pci.o: In function `pcibios_init':
pci.c:(.init.text+0x44): undefined reference to `sbx00_acpi_init'

IMHO there is something to improve...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
