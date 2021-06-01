Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3FF5397483
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 15:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhFANqP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 09:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbhFANqO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 09:46:14 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D375C061574;
        Tue,  1 Jun 2021 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rggE9c9jPClwMN2X8gbCPefstnu44+7rkOqQHsvCaqY=; b=Ja79jS70YoAJsu+15UKjw295C
        rS1Xu2kgPjWmCUgzmyCEv3/Xh6H7DHwnYCAnhiXz2Gz/5BhvwG7y7DAY7DLFZWR8mIg+LHWApYR/6
        RPZy5sBIg0a7UpxThUigANBRcMG2SJSvSBAeL7vEmlksKJvIqbYpQjqvpljcADLWVqEp4iNarIHxN
        76ARqzlh9WTujtDTz34LYT9+JxY8mQ4oNl9+kB0e0Ng1q3WP+vT5ipFCBIalHe3Z9pidvnoasNbaF
        J2+oN/tfVjHXAlyODBslqJEb+dkwcukc689ywesw2Wae6vWAgw/EXiY81s/EFcig+nGX2rrekns3A
        GY56DLZew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44576)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lo4h5-00048n-7n; Tue, 01 Jun 2021 14:44:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lo4h3-0000AG-LT; Tue, 01 Jun 2021 14:44:29 +0100
Date:   Tue, 1 Jun 2021 14:44:29 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 0/5] consolidate "System RAM" resources setup
Message-ID: <20210601134429.GY30436@shell.armlinux.org.uk>
References: <20210531122959.23499-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531122959.23499-1-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 31, 2021 at 03:29:54PM +0300, Mike Rapoport wrote:
> * arm has "System RAM (boot alias)" that do not seem useful for any other
>   architecture

This is VERY important for kexec and must _not_ be removed, since you
will be causing a userspace regression by doing so.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
