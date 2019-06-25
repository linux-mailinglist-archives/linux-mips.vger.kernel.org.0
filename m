Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7423E52756
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 11:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbfFYJAA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 25 Jun 2019 05:00:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:50446 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726543AbfFYI77 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 04:59:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D605FAEAA;
        Tue, 25 Jun 2019 08:59:58 +0000 (UTC)
Date:   Tue, 25 Jun 2019 10:59:58 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Joshua Kinard <kumba@gentoo.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: SGI-IP30
Message-Id: <20190625105958.a7764976a3687cbb8d960a50@suse.de>
In-Reply-To: <20190624175553.2tpepq5zsamovrra@pburton-laptop>
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
        <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
        <20190624175553.2tpepq5zsamovrra@pburton-laptop>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 24 Jun 2019 17:55:55 +0000
Paul Burton <paul.burton@mips.com> wrote:

> On Sat, Jun 22, 2019 at 02:42:05PM +0200, Carlo Pisani wrote:
> > hi guys
> > I am new on this mailing list, is there anyone on SGI-IP30?
> > I am with kernel 4.18, there are a few quirks ... with the SMP
> > 
> > =)
> 
> Since we don't have IP30 support upstream I presume you must be getting
> your kernel source from somewhere else?
> 
> I'm afraid I don't have access to any of these old SGI systems myself,
> but your best chances are probably:
> 
> - Thomas Bodendoerfer who's recently done some work refactoring IP27
>   code in an effort to also support IP30 & other systems.

I have a patchset ready for IP30 support, but I'm waiting for two other patchsets,
which need to get merged first :-( This is

https://marc.info/?l=linux-kernel&m=155929848918599&w=2
https://marc.info/?l=linux-kernel&m=155929849418602&w=2

and

https://marc.info/?l=linux-kernel&m=156044570923085&w=2

If wanted I can post the IP30 patchset for review and testing.

Thomas.

-- 
SUSE Linux GmbH
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
