Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F4616BA33
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2020 08:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgBYHEJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Feb 2020 02:04:09 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41000 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBYHEJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Feb 2020 02:04:09 -0500
Received: by mail-pl1-f195.google.com with SMTP id t14so5101630plr.8;
        Mon, 24 Feb 2020 23:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=iYcb5A6UzA2Shk8jjtL3apQZNq8xVehLtpqARp80zYk=;
        b=VXAPUK4Rl/ReAcodLmMjLrxuTe4YQXk6AeDGov8QK71S9/RLr+THuX4RoKKDhpVHrG
         lTyIF31HLLj1h+3mrlRjH/DEs1yFX/5F0qFahS7NNf80DgDWlPkVcxsE+cdLSO/F/ouZ
         H3bre8cQQ6ycfDGQY+T/7S3RqFe5Ay8cIVtnblQnigCEmNzylAa/wXC2tSrY8l1GS1zN
         m53hRSqZmeyBT3XHds6O6yn+i64dKk7Em1NdzgxaGX2IG4rSU5TwzWLQJWSR36MTqbfC
         J9k3AW3N5IzSTAuw+/5fDjmslZ6J6aUDDoE68mAPlxlny8oet/dSk12HDDjWuybo/HAq
         qJZg==
X-Gm-Message-State: APjAAAXUkkuPZEW7n3jnZDtJ6I1hUCw1X6r/ES9wDBenZBQZFqVGyTTw
        8ZLox94c6a3wyOUn9Pq1c7I=
X-Google-Smtp-Source: APXvYqzD6D5xMLYJA5CvMIbTvN5K9gW/ZqKWDK+ekhwz+ssY3ksY81LFSi4rnKrzKMe4b76xgJ0ixA==
X-Received: by 2002:a17:902:6a84:: with SMTP id n4mr53128896plk.294.1582614248011;
        Mon, 24 Feb 2020 23:04:08 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id 13sm15331394pfi.78.2020.02.24.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 23:04:07 -0800 (PST)
Message-ID: <5e54c6e7.1c69fb81.ef5e1.a15a@mx.google.com>
Date:   Mon, 24 Feb 2020 23:04:01 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Hand MIPS over to Thomas
References:  <20200222170417.1531867-1-paulburton@kernel.org>
In-Reply-To:  <20200222170417.1531867-1-paulburton@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> My time with MIPS the company has reached its end, and so at best I'll
> have little time spend on maintaining arch/mips/.
> 
> Ralf last authored a patch over 2 years ago, the last time he committed
> one is even further back & activity was sporadic for a while before
> that. The reality is that he isn't active.
> 
> Having a new maintainer with time to do things properly will be
> beneficial all round. Thomas Bogendoerfer has been involved in MIPS
> development for a long time & has offered to step up as maintainer, so
> add Thomas and remove myself & Ralf from the MIPS entry.
> 
> Ralf already has an entry in CREDITS to honor his contributions, so this
> just adds one for me.

Applied to mips-fixes.

> commit 3234f4ed3066
> https://git.kernel.org/mips/c/3234f4ed3066
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
