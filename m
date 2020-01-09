Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74246136088
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 19:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388605AbgAISwj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 13:52:39 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38183 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgAISwj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jan 2020 13:52:39 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so3639849pgm.5;
        Thu, 09 Jan 2020 10:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=7KxrUB9+0m2ZmXZKSIGQNkA9bai1IRwAh0T3j87NHzs=;
        b=WFtqfC/LVSYqbu2YCH4S783eUT/K/0aEddKYY3CMaO4XU4Kf/pjVm+ZaBc5ho969AS
         14Wu1kPkZ6BNGvyIeOo/TuDPsYhcNcGReaSajzVvHS+0pZt8yWn12YXg3V+lPUCc3l48
         1oQtnIHu/ck95pO6saDBRLwggRTAr3+d4WfN4yEBnpMKT6lNQ9ubdp0MOdXizKLTXkp9
         HzjzH2txt1xM29j/G16Vpf5WN9EIBufkZfOPkB9d9v1n3eDPW91qeXcj6j03dZgLPrex
         8ZS/KByyMwV3iEpbpIKtIRXeqm6QJBOGVTuA1e4ZTaA6LzTR63T3kEzXrNyplXkDktqz
         q61w==
X-Gm-Message-State: APjAAAVCU5eqDoXZCBanH1HUVHD5uG0Ro7qO0LZqfRyuYOXm4do4mc6N
        Arv3rZn1P2xbZBGC9cweOG0=
X-Google-Smtp-Source: APXvYqyGtSItYLk7YxkEwXMyFJ7xF53zts+ddz8toSSIK0Rp57HKEwN/kJjaBLGBmonXCEdXNM6SQA==
X-Received: by 2002:a63:4824:: with SMTP id v36mr12895731pga.343.1578595958053;
        Thu, 09 Jan 2020 10:52:38 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id f9sm8492500pfd.141.2020.01.09.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 10:52:37 -0800 (PST)
Message-ID: <5e177675.1c69fb81.61ebf.5532@mx.google.com>
Date:   Thu, 09 Jan 2020 10:52:36 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Paul Burton <paulburton@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/3] MIPS: SGI-IP27: Fix node_distance
References:  <20200109122331.4109-1-tbogendoerfer@suse.de>
In-Reply-To:  <20200109122331.4109-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> node_distance must return values starting from 10 up to 255. 10 means
> local, 255 unreachable.

Series applied to mips-next.

> MIPS: SGI-IP27: Fix node_distance
>   commit a20ebc047a4a
>   https://git.kernel.org/mips/c/a20ebc047a4a
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Loongson64: Fix node_distance()
>   commit a14879e149c9
>   https://git.kernel.org/mips/c/a14879e149c9
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: mm: Place per_cpu on different nodes, if NUMA is enabled
>   commit f3c560a61b4e
>   https://git.kernel.org/mips/c/f3c560a61b4e
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
