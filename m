Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0B275A10
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 16:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIWOcH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 10:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWOcH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 10:32:07 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284C0C0613CE;
        Wed, 23 Sep 2020 07:32:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f1so6924688plo.13;
        Wed, 23 Sep 2020 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OGwdlXDnTAZD2Zb516ICMPvsFM+7oJAWzX58TFEAviI=;
        b=hGcdUm8KJY2qyuDh/7NjLkugpqRvn9BlJ4x+za48n2cxs43uMqE6FwgqkB2PFfo/sE
         bfnPJ99PEM014jz8w454GQt/DdOh4xj98sjsXJyds71Pdhu/pHGS4KRs60vdqPgun4+5
         MzbYW24A9Ze6SaK+3Ng+aSdNFT2zdyhpM4JgRVXXs/L2uX3M9D9fKTcCFCzsoUJnfOBJ
         Kqw67kaVZ3KWnWwewwVbm1QcXsRfB6047LJsr0Y1l7UlWto/I3IztHf0Vu/jFK1j0GhZ
         qMxH0Jq433yrKue3ajx+CfyNowCkU1D2CpMSAu+uVbbZ/Rkibd8QHheJ8eem5rzI5PA6
         ma8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OGwdlXDnTAZD2Zb516ICMPvsFM+7oJAWzX58TFEAviI=;
        b=pHfhB1v/OIzVmlLe/22FfRDECRrCcYyazTFt/G2VhrYYMeooQGHyFPYc0pOZaXIqmg
         uwdbmux6LQpFq2V0WBpfcFdY3mWwY/CaRBUpHrx2YLYk07PvrTYoKxU135Z3NNWDjqF/
         9A552hIG099JBoJKxz0OsqehjGpYP7KsQLRWT63pTxi9isHaem1VK3dFlg2W9C1ZonQJ
         450DQldxEecdyfKz6AlsR8AXESgUpcZnbZIJW38Yxu7N4/5P5O3hh7P9vOesMqg2lt9O
         FhqO9a0csKcvzW+grdGf9iJTuRDXsPCmrckPHRcedz/6xAgOTQ2F3GNBibGX424C62+l
         tMzQ==
X-Gm-Message-State: AOAM533Ut13PJIklGlglTjrVqrs6aJAFaurIiAlcGdHnlAYZelNhnJ9p
        8edNUPYFnf9xnnnD/OrZvZjjf5pZoUk=
X-Google-Smtp-Source: ABdhPJzTArcqV/mAFMrTD+Ke6/qZHIHV/RfqDOBzdR/B4sKGVRghDOLeU2gDVVzrk1zqIqJpDXZDyg==
X-Received: by 2002:a17:90a:1b62:: with SMTP id q89mr8657518pjq.74.1600871526680;
        Wed, 23 Sep 2020 07:32:06 -0700 (PDT)
Received: from tkernel.org ([103.209.252.252])
        by smtp.gmail.com with ESMTPSA id b4sm5272692pjz.22.2020.09.23.07.31.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 07:32:06 -0700 (PDT)
Date:   Wed, 23 Sep 2020 22:31:52 +0800
From:   Du Huanpeng <u74147@gmail.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     WANG Xuerui <git@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH 1/4] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Message-ID: <20200923143149.GA11566@tkernel.org>
References: <20200923075845.360974-1-git@xen0n.name>
 <20200923075845.360974-2-git@xen0n.name>
 <2a478254-c4de-49dd-d598-c7553f4672bf@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a478254-c4de-49dd-d598-c7553f4672bf@loongson.cn>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> rtc-ls2x --> rtc-ls2x-ls7a
> RTC_DRV_LS2X --> RTC_DRV_LS2X_LS7A
> Loongson LS2X RTC --> Loongson LS2X/LS7A RTC
> 
> Maybe the related names include ls7a or LS7A is better to
> reflect the reality?

Is there any difference with the rtc IP in loongson 1* SoCs?

Regards,
Du Huanpeng
