Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2207713CCAD
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 19:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgAOS7Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jan 2020 13:59:25 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39840 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgAOS7Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Jan 2020 13:59:24 -0500
Received: by mail-pj1-f68.google.com with SMTP id e11so339425pjt.4;
        Wed, 15 Jan 2020 10:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=DyppBfshrye8qTHhZa2Kv3JsiH97KEI85KOqIZoNV6I=;
        b=kNIp5rS1qkimUXpawUFfl0SquXnlt8vOXvwoIlSTUNef+z0iUbSjBC1hMtkx6TQJOE
         unUnYopChX+xloDA6uDg16hQzQXYvnu1jZEAUQg/wRYYap9BcAz6z39sd50mNUU5XOS4
         K9xZgCWV7fWk9v2XYJcNTzwJz0u0Q1aFXX70met2dOCA5cgEjVWRfGi1+8e8Jt46Ingf
         QNBQCtX5geo5+9oI48uC5/Kno38QpkGSiUwoBJ3YUaqJPWOAxqxBGULdoJzEExURBML5
         gvg+2S53LbCpODnKtp5d22bSy3DhjD4APPLHVpGrt0wutyZAvreZXsNFhfIaIBTsbCeY
         BIzQ==
X-Gm-Message-State: APjAAAXTYhpk9H/jGJxZ6lDMKQnCXzWqHPhPh8DKKR5CVN59IKsdYQti
        mJGCVOLjWrVxJmP+0mAs0kA=
X-Google-Smtp-Source: APXvYqxBxwGUQ8otfpFu/t6oEuJ1Ea6qKpXo9NB+OIJ0Vo/2mzZ5htzWt1g6fQ5G3FAUc60mMl1KbQ==
X-Received: by 2002:a17:902:bd94:: with SMTP id q20mr27438105pls.343.1579114763636;
        Wed, 15 Jan 2020 10:59:23 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id i17sm21682761pfr.67.2020.01.15.10.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 10:59:23 -0800 (PST)
Message-ID: <5e1f610b.1c69fb81.f82c3.5b13@mx.google.com>
Date:   Wed, 15 Jan 2020 10:59:22 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Guoyun Sun <sunguoyun@loongson.cn>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guoyun Sun <sunguoyun@loongson.cn>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH V2] mips/vdso: Support mremap() for vDSO
References:  <1579059300-6636-1-git-send-email-sunguoyun@loongson.cn>
In-Reply-To:  <1579059300-6636-1-git-send-email-sunguoyun@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Guoyun Sun wrote:
> vDSO VMA address is saved in mm_context for the purpose of using
> restorer from vDSO page to return to userspace after signal handling.
> 
> In Checkpoint Restore in Userspace (CRIU) project we place vDSO VMA
> on restore back to the place where it was on the dump.
> 
> Make vDSO code track the VMA address by supplying .mremap() fops
> the same way it's done for x86 and arm by:
> commit b059a453b1cf ("x86/vdso: Add mremap hook to vm_special_mapping")
> commit 739586951b8a ("arm64/vdso: Support mremap() for vDSO").

Applied to mips-next.

> commit ad1df95419cc
> https://git.kernel.org/mips/c/ad1df95419cc
> 
> Signed-off-by: Guoyun Sun <sunguoyun@loongson.cn>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
