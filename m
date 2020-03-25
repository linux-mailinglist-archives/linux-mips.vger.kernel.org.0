Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A810B19299D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 14:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgCYN2M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 09:28:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33214 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgCYN2M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Mar 2020 09:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=2NO/n6kduwBIqc4l0ZX8BdD5kNqK6OZFb73WmpZkDbA=; b=jlzPnzl9AXcsu1Q6Jqasiq7vke
        JBmxbJMAxZOqyMXT/D3NU0q2UJrIJy4nV47kZ3AN1EKqNLCVYGvk9MN1aquTjlc33LvR4aa5/TYdw
        F8ptj101FjBfXMqdDStSGHSeoQbHaptENbZDhzD4dQQeNJziCAc8Vnq9g5FLUdq6C+95qk1+V/Fud
        hkRrHmyTF5+egWjVECXrhEkPewed7x+c9fZkiEOX2vWteWLGRlQPpGe5Kjy2YEHOImvuOb4ca+/fa
        4Q4AA/cbX8sRJWYSXRLRwte4TnCMQP2GgxosW05UPga49CUvuTY9QdfAlca2XhyEG444NIEGoIzzg
        jJxhfwGA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jH64a-00055b-S1; Wed, 25 Mar 2020 13:27:56 +0000
Date:   Wed, 25 Mar 2020 06:27:56 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 2/3] MIPS: Loongson: Add DMA support for 7A1000
Message-ID: <20200325132756.GA13750@infradead.org>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
 <1584932355-3642-3-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584932355-3642-3-git-send-email-yangtiezhu@loongson.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 23, 2020 at 10:59:14AM +0800, Tiezhu Yang wrote:
> Implement __phys_to_dma() and __dma_to_phys() according to the
> node id offset in the 7A1000 DMA route config register.

Can you please try to just use the dma_pfn_offset field in struct device
for all loongson platforms?  I'm pretty sure I asked for that last time
around..
