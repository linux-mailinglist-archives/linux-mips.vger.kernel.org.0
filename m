Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF0ECBE6
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKAX2A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:28:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42840 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAX2A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:28:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id s23so4004923pgo.9
        for <linux-mips@vger.kernel.org>; Fri, 01 Nov 2019 16:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=CNPSxUe8IYDj8llAFgtwme8kxwBt9t4kpzeFxOQXh64=;
        b=RL3cBlwK9fTU6lhYcUK6eWRmwSw/N13ztTUZA9Bfg921y+uXIzoPmj9LHJsfYvrudI
         oX/UjDTKgVBCy/TL8rwfMU7Nr8EUf8fXRkH3NhiZ9CzYklkGWheXcGj4kr+zrAgiHFLG
         xelDSoV0O/HCuMPnS/viHkrXVyT8GCwzOP5LNNu9jqgkoqisWt/kbzaUk8uGKLsj2F4+
         GwzQXXTC9w61ipHdTdBKvJ4mLNTX1g6nuC0630Trs4YnLvoZgvsY2Jej7c74j+UjgHB7
         SaZmOhVID8ilW1uHrqHhMDk9aO5nFXGN1OS2xrv22Go9wohj+q0nKxWHTMnNHAcFFrVS
         0lXg==
X-Gm-Message-State: APjAAAUiXczuoiAhqozE+t8/70QZ6euWcShV+0W2o+iZ1cTlSAl1C2Jl
        j8zLOyW4UO+ce+9LRgG1eWU=
X-Google-Smtp-Source: APXvYqwLaZfoMcLtnlz6VSiJzaIpYNip827bJ9X3aq85KzrmmZfrUeK9Xf+km5NHxc/KYiaPuj7Yvg==
X-Received: by 2002:a65:6085:: with SMTP id t5mr16400847pgu.450.1572650879388;
        Fri, 01 Nov 2019 16:27:59 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id q3sm7634110pgj.54.2019.11.01.16.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:27:58 -0700 (PDT)
Message-ID: <5dbcbf7e.1c69fb81.51039.6513@mx.google.com>
Date:   Fri, 01 Nov 2019 16:27:57 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
CC:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/6] MIPS: Loongson2ef: clean up loongson64 related code
References:  <20191020144318.18341-4-jiaxun.yang@flygoat.com>
In-Reply-To:  <20191020144318.18341-4-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> Remove unrelevent macros, defines and codes from loongson2ef mach.
> Also rename some defines to match new naming.

Applied to mips-next.

> commit 5831fdb099dd
> https://git.kernel.org/mips/c/5831fdb099dd
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
