Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D60BCD2CD2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 16:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfJJOsw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 10 Oct 2019 10:48:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:38142 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbfJJOsw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Oct 2019 10:48:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EB287AC7B;
        Thu, 10 Oct 2019 14:48:50 +0000 (UTC)
Date:   Thu, 10 Oct 2019 16:48:50 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: add support for SGI Octane (IP30)
Message-Id: <20191010164850.34a8d2274720e1bc26fd34d8@suse.de>
In-Reply-To: <20191010135308.GA2052@infradead.org>
References: <20191009155928.3047-1-tbogendoerfer@suse.de>
        <20191009184311.GA20261@infradead.org>
        <20191010150136.a30e47b37f8c8aed9e863a5e@suse.de>
        <20191010135308.GA2052@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 10 Oct 2019 06:53:08 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Oct 10, 2019 at 03:01:36PM +0200, Thomas Bogendoerfer wrote:
> > ok, as far as I can anticipate IP35 verion of this functions will be
> > the same as well. So I'll move both into pci-xtalk-bridge.c in the
> > next version of the patch.
> 
> Sounds good.  In fact you probably want to send a prep patch just
> moving pci-ip27.c to pci-xtalk-bridge.c and adding a new
> CONFIG_MIPS_PCI_XTALK_BRIDGE option that all these ports can select.

the option is already there and used by IP27.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
