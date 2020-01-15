Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC2613B686
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 01:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgAOAYO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 19:24:14 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35229 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728774AbgAOAYO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jan 2020 19:24:14 -0500
Received: by mail-pj1-f66.google.com with SMTP id s7so6717933pjc.0
        for <linux-mips@vger.kernel.org>; Tue, 14 Jan 2020 16:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=hXUqFbNU2PoN35tRfIq/ezRfjlU7XHeM5M9d54tkoqs=;
        b=KtoRene21YnhNd6K5tWkOtHn07ERJ9yS50et+3y65qfzKOe0WAd+3DPcxZ+12rhtmF
         rXLM/rvDfZwjAcFoTrbC45jrmOX8/DVZ1pKuncKy/MmxvCoTl7P/hjKRDxOm0ad49+Sk
         FJRvQZo35Fft6dFppKsMpyRpq+39YHxiSm9LCwpHlegT9O9ZS7v1rQ3mbw1DWgj3kjWa
         NwmMogg8k+0EO5CIwWYFxQkXEo1g0cVFU0DEH2JWVwz2UDUyEglHYIoIalTN3rKxIEkS
         K6iUZZWGDuJfwk+E2huSK5DTuq+X8FjqbnvY25Qhbjmz/pgrB21Vy/JyWP3fkLcjmxW+
         8Aig==
X-Gm-Message-State: APjAAAVAzLOOuYEKJxiMKmSXX7pHS3wffv5d9ESR7O73k3mGcLCbquPD
        gjXHEz70R3pgbNZq9jH8uu8=
X-Google-Smtp-Source: APXvYqw9sK4Q8kn6cuUMmYcofDPq4oxoZwwDf3nqqWx3djlFiEybyAd1Y8cLmwHrTZtrZWvl48ku0Q==
X-Received: by 2002:a17:902:d694:: with SMTP id v20mr23083221ply.127.1579047853472;
        Tue, 14 Jan 2020 16:24:13 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id r2sm18031531pgv.16.2020.01.14.16.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 16:24:12 -0800 (PST)
Message-ID: <5e1e5bac.1c69fb81.cca07.b81a@mx.google.com>
Date:   Tue, 14 Jan 2020 16:24:10 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Stefan Roese <sr@denx.de>
CC:     linux-mips@vger.kernel.org
CC:     Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/3] MIPS: ralink: dts: mt7628a.dtsi: Add WMAC DT node
References:  <20200114084806.2420-1-sr@denx.de>
In-Reply-To:  <20200114084806.2420-1-sr@denx.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Stefan Roese wrote:
> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
> 
> This patch adds the WMAC controller description to the MT7628A dtsi file.

Series applied to mips-next.

> MIPS: ralink: dts: mt7628a.dtsi: Add WMAC DT node
>   commit ff68d0da5a16
>   https://git.kernel.org/mips/c/ff68d0da5a16
>   
>   Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: ralink: dts: gardena_smart_gateway_mt7688: Enable WMAC
>   commit a5d193cb88cf
>   https://git.kernel.org/mips/c/a5d193cb88cf
>   
>   Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: ralink: dts: gardena_smart_gateway_mt7688: Limit UART1
>   commit e8c192011c92
>   https://git.kernel.org/mips/c/e8c192011c92
>   
>   Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
