Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA421F86D3
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgFNErB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgFNErA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:47:00 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F382C03E96F;
        Sat, 13 Jun 2020 21:47:00 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z63so5393953pfb.1;
        Sat, 13 Jun 2020 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Pp6Jc/qHwm3K6KLFEXAkOU6QAZIaSNRey/DKSNOkpJY=;
        b=cptDdR0DEVeZ4KYgevCi9wev5HLtrFZ2MS2Yr0evL20z7ZKpLJ8QbySJhXUig6BuAt
         ucSYr/swKdFVvmLaQ/qeZcGqcqFN3GPScD02AYEp56gzVytFPhqKnkbFMVQpvV20TE0J
         DO3UnF2C33c5leg+5QBc+LgewXzurNNZpSEqFOol0NEWFbopaP1pZTfW8mewVhXtMKLl
         XZXjzep3ehLKYHUWlDI8SIoSm60Iet7At/pEJdmBy2SOHdwu2KTbm6Z907fdrhqpNkkx
         ur9F0I/E+oWibjc/OmEUearlP5eTu2Z8TSfC+IFcpx0FBRoOZKMOnd1Fmwb0HlGL3cAm
         2Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pp6Jc/qHwm3K6KLFEXAkOU6QAZIaSNRey/DKSNOkpJY=;
        b=BGPc4z0GD1QJm3IkWJB5d4+eWt2mh7MYBEZN/iQ1Fzn7G89ecWNTnYg8zykxpHZb9w
         NqZ7+TKqo6N4hkof6ell14ouse9eEM+iNAg/JXU1e3EAIDilIUWPFdZo7neVDSnN78r4
         1vv13Y31n+3YFHuRMcEO9EkMntITqQ/dnhQodeCTfP0uoivbToVedgaskI53Cyj9nZSG
         7fv3oZI7rkSMipcELUsFx36qclrrgVqGoAwkoDz0n+VdI5giItc/O2Ufla3BJocIfURE
         dNuHoerNCcuGHkSu5AoMf6yeugiXyNZiL4iIdyaUVsZ6/OJ++7SCkbuJZmU2OlS0fFrZ
         PJSQ==
X-Gm-Message-State: AOAM531A1vu2h5N+4HZjyk4r70+yYGC5KMHg7Y+P6wlc52R3F2jo6omW
        3yAvoXWsM6WorZSw91NuJT0=
X-Google-Smtp-Source: ABdhPJzX9uljtFiFec49acFDeQCDPizUF+M+Vtn7EfblpUiywH1xhNMuv7QunwnsbEi0ARJnvMYU2g==
X-Received: by 2002:a63:5a60:: with SMTP id k32mr2995633pgm.73.1592110020212;
        Sat, 13 Jun 2020 21:47:00 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id m7sm9057955pgg.69.2020.06.13.21.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:46:59 -0700 (PDT)
Subject: Re: [PATCH v4 5/9] mips: bmips: add BCM6318 power domain definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-6-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bd9779e9-5a67-c0ba-b179-f5b4de743ed6@gmail.com>
Date:   Sat, 13 Jun 2020 21:46:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613082140.2009461-6-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:21 AM, Álvaro Fernández Rojas wrote:
> BCM6318 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>
-- 
Florian
