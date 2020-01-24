Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 764AE148EC0
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 20:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391246AbgAXTi4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 14:38:56 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55243 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390186AbgAXTiz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jan 2020 14:38:55 -0500
Received: by mail-pj1-f67.google.com with SMTP id kx11so255782pjb.4;
        Fri, 24 Jan 2020 11:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=DXdOMyfkOERTPkCfrxYPudbmkrJHKSqSlys3/OUpdf8=;
        b=Yg2QNpfEbKpFoVQsFsTavMjPoT1KPIlnnVaXMtNBU44oB81kbz0DOIMYujnFqgyYFD
         HY4+JiEd5knUMApuTKfQkzIkVG/OjYVYL5kVcoovdn1zayUt7EmnDeTdDGIJtryHTIQM
         pTicCaoo0ojWB6FGWPtSutEzCo0qsTb+z6dKK7S9Jov2jXS2MuHWI8p7GUpWnhLT/IDU
         HQ2evAR5vshnFgVxIaltVXDZbLUhHC6tCeZcJoWLohYBvtDHl81DIsg94FrIvGVvzDZ5
         Wqj2Eb53VZxlIaeqObwB2PC0gZ3bL+bgXp0OYwfpqwq7pan1J0YKnT/1vB6Oi807ef8R
         5AAQ==
X-Gm-Message-State: APjAAAX4Ttxo5Bejm1nHJ3k6zxeNzLGSUjyx62QrEzSqqlO01/S25BR0
        Ykk78uFYVHvkvzaM5zcxl80=
X-Google-Smtp-Source: APXvYqxOCgCW2i/RX0z25iq5+UgvghYEUhtCRsARbnCn4S/HFKwFLjpfYvp6TRzNLLFJPpJREomx2A==
X-Received: by 2002:a17:90a:a48c:: with SMTP id z12mr934560pjp.38.1579894735169;
        Fri, 24 Jan 2020 11:38:55 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id d3sm6693586pfn.113.2020.01.24.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 11:38:54 -0800 (PST)
Message-ID: <5e2b47ce.1c69fb81.ab192.126e@mx.google.com>
Date:   Fri, 24 Jan 2020 11:38:53 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel
References:  <20200124131609.4569-1-tbogendoerfer@suse.de>
In-Reply-To:  <20200124131609.4569-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Add detection for IOC3 chips in IP35 machines.

Applied to mips-next.

> commit 2c4288719806
> https://git.kernel.org/mips/c/2c4288719806
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
