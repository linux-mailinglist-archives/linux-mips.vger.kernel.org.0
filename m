Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F2B36624F
	for <lists+linux-mips@lfdr.de>; Wed, 21 Apr 2021 00:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhDTW5F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 18:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhDTW5F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 18:57:05 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF86C06174A;
        Tue, 20 Apr 2021 15:56:33 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso32564240otv.6;
        Tue, 20 Apr 2021 15:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vcNH37yHMvcdC/MIfvM5NaS1Yc3VO2Vq5NGFDgGaXz4=;
        b=hkBfzpg3NwTklfYcRHxbjLmvWVwI7QwCyX4oqVwUilM+Mdhg7HBgN4g9q2otujmhOj
         0PXWGh0NC3BB9STmP7lyMmJRUdCCfjTzMubQwkCcGg9crEOhYue2Nmkdai3okfUAz3pL
         qzf8ChBFFOITs7ZgnNuVEE1qqAvYJKQtyC7Zky65mk/YhWXVqgERqJ3H8mrHvVGGFRz+
         wWbd10FMlUYQ6c8Y9jhrJk/uLS88UOAJZ3p9CSXl8dr7WTHB5RdoMuL25JPtDj1SJAn2
         9+XC/Z6VG973My3AlRgJyLdNzs/fo/YNn9Foi2YSaJk4r1kDxzY8BIoFTbw1lPetW0Vi
         QquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vcNH37yHMvcdC/MIfvM5NaS1Yc3VO2Vq5NGFDgGaXz4=;
        b=KUYqVqpSoXGqzxuo/XVrIXEx16hvT7incOxx4UA6ZQHE8XgUlOF3LOlgcksYsA6ZcX
         68l6I26JS9k1lnIGCqIkJT83mLMeN9bWNsx2+i+hj8yPS0abLe8wPitxzPW4dKcXgvrU
         ndtM5jgo+vbIppj4C8LrqGDqHNoQDAZah3AarfS/roqyadLE5Or0PTAkV+NeMK/wPloe
         Xv901xFke/VB+lANyesg+7p/e/vxCtKd7TLt8ltzc/E754aKbP9TmYmhOuHXjIOE+5VF
         joWIz1gAI7wf+K7eBOHiZqf5WoLfUYzp51DyE0zGvlzDfDSQO/DPRMJws1hir4As2w/x
         /7vw==
X-Gm-Message-State: AOAM531MaKjrQe8sGkB0y5kffVdJ1ZCoTkj2GhPRxIGwixdXxCJf4Tp5
        e3gCp2h3Xc73Vb+VKJlhsRk=
X-Google-Smtp-Source: ABdhPJwvCpg9HqAeNNaP11yB/2Oev5Xp43aKOsvHBwwF0tNhShT/JOvo6Zrxc+a+xQek8u8Nu0ys6Q==
X-Received: by 2002:a9d:764b:: with SMTP id o11mr15874864otl.149.1618959392882;
        Tue, 20 Apr 2021 15:56:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v17sm115193oot.10.2021.04.20.15.56.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 15:56:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 20 Apr 2021 15:56:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci-legacy: revert "use generic
 pci_enable_resources"
Message-ID: <20210420225630.GA223531@roeck-us.net>
References: <20210420052319.GA162457@roeck-us.net>
 <20210420063942.7041-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420063942.7041-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 19, 2021 at 11:39:43PM -0700, Ilya Lipnitskiy wrote:
> This mostly reverts commit 99bca615d895 ("MIPS: pci-legacy: use generic
> pci_enable_resources"). Fixes regressions such as:
>   ata_piix 0000:00:0a.1: can't enable device: BAR 0 [io  0x01f0-0x01f7] not
> 	claimed
>   ata_piix: probe of 0000:00:0a.1 failed with error -22
> 
> The only changes from the strict revert are to fix checkpatch errors:
>   ERROR: spaces required around that '=' (ctx:VxV)
>   #33: FILE: arch/mips/pci/pci-legacy.c:252:
>   +	for (idx=0; idx < PCI_NUM_RESOURCES; idx++) {
>  	        ^
> 
>   ERROR: do not use assignment in if condition
>   #67: FILE: arch/mips/pci/pci-legacy.c:284:
>   +	if ((err = pcibios_enable_resources(dev, mask)) < 0)
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
