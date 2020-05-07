Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F2E1C7FD5
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 03:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgEGBd7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 21:33:59 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40943 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728627AbgEGBd7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 21:33:59 -0400
Received: by mail-il1-f194.google.com with SMTP id e8so494528ilm.7;
        Wed, 06 May 2020 18:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCylJgABUnzQ0E9XU7BvrcKk5G6SKChz6Kr+QXgAThA=;
        b=WgAhf+HXN/Qxe4LBDcd7lU6AYbmId+rci4n7PfZbWKmDayj1gKrJ+3ZI6aH4DV/T/x
         bukkxYmXookqL6BYvbhC3WVNV3FN8VSWkJ3mfp+y6Jw8C/HbABEP2t9wQVotPOLAA+S7
         CGLz+eV83FpZ0ZvjQJUpNbLvQXFhAsgIOeFwiGHduiI9pjwJh3jFl7Bx3COoFhwNYAQ6
         i5DKJfcUrEySHcy0NaK02SgDhFdYlcWqtE90hvp+XHVnjNRRNQUa6lVtZ2KTdEu0Ejy+
         /A7SGrXG6a4Q1ghuuTFJnytH79ZdqAm7DSnoIiwbdRh3mwmRTqGSaJAsxfF984Au3ihV
         X95Q==
X-Gm-Message-State: AGi0PuYvEXBvgor0zHmMZf+wkOYIa8zHVPtdpF9SB7SKe22zOlQGNUmk
        bVaIzgcPYyPKEfk/xFuCEhvgHjBbScm063ygpF4=
X-Google-Smtp-Source: APiQypIUy1wGCEHo7jfnrv9dqP9uPJXJaBu6bRbhpsazSAtlvs/E5H0NgL+qI/G8CQVoWcBSVlRcMzFqsXIn9wbFZWQ=
X-Received: by 2002:a92:5d0f:: with SMTP id r15mr11975672ilb.251.1588815238547;
 Wed, 06 May 2020 18:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com>
 <7d7f6211-f6bc-daae-5b13-b54092e762a1@loongson.cn> <CAAhV-H7jX9uVwb+GnaKXHPBsBQY35YKccbDedLrmfp8-hveVfw@mail.gmail.com>
 <20200506144208.GD27643@infradead.org>
In-Reply-To: <20200506144208.GD27643@infradead.org>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 7 May 2020 09:41:36 +0800
Message-ID: <CAAhV-H4Mmu2LJx9crUTkOirH2RGr8XfHW7RCUmaT5T4mmYcaKg@mail.gmail.com>
Subject: Re: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Christoph,

On Wed, May 6, 2020 at 10:44 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, May 06, 2020 at 04:47:30PM +0800, Huacai Chen wrote:
> > > For the above reasons, I think what you are concerned is not a
> > > big deal.
> > I don't think so, this is obviously a regression. If we can accept a
> > regression of RS780E, why we still maintain Loongson-2EF rather than
> > simply drop them?
>
> While I much prefer to use the default, regression an otherwise
> working platform seems like a bad idea.  I don't really know much
> about the Loongson platforms, do they all boot using the same kernel
> image?
All Loongson-3 machines (with LS7A bridge or RS780 bridge) use the
same kernel image.
