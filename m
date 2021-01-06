Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E0F2EC60B
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 23:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbhAFWIa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 17:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbhAFWIa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 17:08:30 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7559CC061357
        for <linux-mips@vger.kernel.org>; Wed,  6 Jan 2021 14:07:39 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id j1so2262658pld.3
        for <linux-mips@vger.kernel.org>; Wed, 06 Jan 2021 14:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gbjKi+e71SsDc4NQCGiMvj4AXo+uTKzbkijgCrcadUM=;
        b=Y5TZ6jxBBm/t//yk2kjS7Gjfn3fFGsD1g3z9HQqPgTjtZde8ZWcu3graMZoJkKtZZZ
         MkiZSEK3xKr8OXScasaNj+YV1XnCBpfS+L7oi1659Gp+hquBN4uXfNpC+SO7iLc3NVeF
         PL2lx9hOtRtSn3fTvdziY2o4PEcTtokVRdRvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gbjKi+e71SsDc4NQCGiMvj4AXo+uTKzbkijgCrcadUM=;
        b=AuOFXGK/lIu3CpdGc1pBT8AqqhvKrqWd+433EYVvK+wSXfQr9iZtYuxsUnPe4GiLPu
         fJs02d4C/C76QF1M83imgbCb0fuEIlNHdpo689Ck3OpYisicNakjssUzMNiTyZAfqAr7
         pfokSr5CgnfVjP1fNrRtOsqtkJ2C5IDDrLdcRLjIbXDvR4uIyLA+29m9jnDUSkMtWAae
         KbJ6s7zDwgHyjduuMdpAlP31ZbqOzWMaPsSIagSl2IH2SFIzvT/XmBRJdL7sBsnvzR5D
         6YFU7/4U05+DQwxVeKI4uWcLwzMvzdpKu30KZQAZdPNbd7jNJCpnQStevvgMqA6ubwH6
         xv1w==
X-Gm-Message-State: AOAM5321o8zd2FhbDMh/HYiC4/zvq2oLd2y8sVRgXWzY24AMb+YfI+iy
        vf0E0I2cAF4PEF06mN6dorgQ3g==
X-Google-Smtp-Source: ABdhPJye/3LwURUaIEkEDIApTlqgY1Vni1YSvZh7LaYprgKmMNlBa9kvzLMPa3ap8VLE+vKqQTDTvg==
X-Received: by 2002:a17:90a:f40e:: with SMTP id ch14mr6170178pjb.172.1609970859090;
        Wed, 06 Jan 2021 14:07:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t6sm2935350pjg.49.2021.01.06.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 14:07:38 -0800 (PST)
Date:   Wed, 6 Jan 2021 14:07:37 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Smith <alex.smith@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 mips-next 4/4] MIPS: select ARCH_WANT_LD_ORPHAN_WARN
Message-ID: <202101061407.6F59BE7@keescook>
References: <20210106200713.31840-1-alobakin@pm.me>
 <20210106200801.31993-1-alobakin@pm.me>
 <20210106200801.31993-4-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106200801.31993-4-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 06, 2021 at 08:08:46PM +0000, Alexander Lobakin wrote:
> Now, after that all the sections are explicitly described and
> declared in vmlinux.lds.S, we can enable ld orphan warnings to
> prevent from missing any new sections in future.
> 
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
