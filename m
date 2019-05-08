Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 542AB172DC
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 09:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfEHHvv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 8 May 2019 03:51:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:59542 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725910AbfEHHvv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 May 2019 03:51:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CD031AEEA;
        Wed,  8 May 2019 07:51:49 +0000 (UTC)
Date:   Wed, 8 May 2019 09:51:49 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/3] MIPS: SGI-IP27 rework part2
Message-Id: <20190508095149.6503bde3f33fb5d76ca827be@suse.de>
In-Reply-To: <20190508061629.GA19227@infradead.org>
References: <20190507210917.4691-1-tbogendoerfer@suse.de>
        <20190508061629.GA19227@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 7 May 2019 23:16:29 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, May 07, 2019 at 11:09:12PM +0200, Thomas Bogendoerfer wrote:
> > architecture and share some hardware (ioc3/bridge). To share
> 
> Isn't much of this also shared by IP35, the next generation Origin/Onyx
> and and co?  A quick web search shows there even is an early port to
> IP35 here:

yes it is, and IP35 is my next target after IP30 is done.

Thomas.

-- 
SUSE Linux GmbH
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
