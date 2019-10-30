Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46F4EA5E7
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2019 23:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfJ3WCx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 30 Oct 2019 18:02:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:36054 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726864AbfJ3WCx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Oct 2019 18:02:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 516FFB1A4;
        Wed, 30 Oct 2019 22:02:51 +0000 (UTC)
Date:   Wed, 30 Oct 2019 23:02:50 +0100
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: fix exception handler replication
Message-Id: <20191030230250.b4eea4be7b2e679cfcd5a184@suse.de>
In-Reply-To: <20191030212606.GB4251@infradead.org>
References: <20191030105819.11266-1-tbogendoerfer@suse.de>
        <20191030212606.GB4251@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 30 Oct 2019 14:26:06 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Oct 30, 2019 at 11:58:19AM +0100, Thomas Bogendoerfer wrote:
> > Commit b3ffcd0d800c ("mips/sgi-ip35: Initial rough-in of minimal platform
> > definition.")
> 
> I can't actually find that commit anywhere.

d'oh, no wonder, it's one of my work in progress commits on a local branch
I wanted to reference 775b089aeffa ("MIPS: tlbex: Remove cpu_has_local_ebase").
I'll resent with correct commit.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 36809 (AG Nürnberg)
Geschäftsführer: Felix Imendörffer
