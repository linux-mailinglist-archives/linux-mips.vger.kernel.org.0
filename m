Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6C51471F6
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 20:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgAWToi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jan 2020 14:44:38 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41230 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728809AbgAWToi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jan 2020 14:44:38 -0500
Received: by mail-pf1-f193.google.com with SMTP id w62so2010211pfw.8;
        Thu, 23 Jan 2020 11:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=/tNzB78rHikk6pi7VwlYHiXMtvqtQwB2ELt1FHbIUmc=;
        b=mOolKALwoRXFVye+bVx4QTz+N2q6rXGNXrNUXFCzRxHW2hJPXRiM4E9vOJackqemi+
         IrZvXxmvqIiRq6HymoTVzLr2zmHTxB3ImDHb74/Kb0ifYuJ40v9sNEIcJB5Q4zNYXunh
         XLc9yh7A48vekwdMBKUDQ91g6xHlHDx8K7kCdtvkV0c6UE5BaJTYqeehrfCPfe07pjO1
         tFEpNj1AEC3pB1NMySPDUED5fv7JLzhJXUmFwINMu8YJKTVeroRhvF/HiWG9FYqId0p5
         lKLv7I044s2dn6Re67wKgjBp6xtqizCAgGnunYs8WkfisO/ZBFWR+PaM4gF+fll53uKO
         P/yg==
X-Gm-Message-State: APjAAAUxNsMyuNahsXyneqlNCRxj+RmvjUrZi5j1fBuvty8NfMCH3i8R
        NZtYEnMDtYrPMWKUrVQbQag=
X-Google-Smtp-Source: APXvYqw6Rycq9zDnR/J5MasZfexkbcK4nGxtqxz9S+mAhUBs6YlH+I/GKahy8R9Nfo7vFZlsjK/d5Q==
X-Received: by 2002:a63:cc4f:: with SMTP id q15mr422378pgi.159.1579808677392;
        Thu, 23 Jan 2020 11:44:37 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id 132sm3930842pgd.76.2020.01.23.11.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:44:36 -0800 (PST)
Message-ID: <5e29f7a4.1c69fb81.6d9f7.9a12@mx.google.com>
Date:   Thu, 23 Jan 2020 11:44:36 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP30: Check for valid pointer before using it
References:  <20200122131334.21970-1-tbogendoerfer@suse.de>
In-Reply-To:  <20200122131334.21970-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Fix issue detected by Smatch:
> 
>     ./arch/mips/sgi-ip30/ip30-irq.c:236 heart_domain_free()
>      warn: variable dereferenced before check 'irqd' (see line 235)

Applied to mips-next.

> commit c0e79fd89749
> https://git.kernel.org/mips/c/c0e79fd89749
> 
> Fixes: 7505576d1c1a ("MIPS: add support for SGI Octane (IP30)")
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
