Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2778243DBE
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 18:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHMQzR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 12:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMQzR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 12:55:17 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7A3C061757;
        Thu, 13 Aug 2020 09:55:17 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u10so2877725plr.7;
        Thu, 13 Aug 2020 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=wxsKhS2l6+3Uh7nPOiKRBonKsZC+1QXIECJzcrgR1Zc=;
        b=NeWvr5tfPwnl+pcteObUQ5oMQEZXL3X3qxl0I2Z8B2q/f9ugOtQdYwdx8Teoo2jzZo
         wWfhVZx4zFtQxJZoHYtMpY4p1ExLS6ORamHKYFy2bRZSYUxyRgp8JpGawWiAaHwuIFZR
         //eHotamC77GqPQ5LF90DhEE4QdMQ3313HXhKuU6Azy9B2gtKEAZVVF5oAI38xUMwntw
         F2sh/d48onjk2YB8TX+stMTib2DI/Pw3HmkxRewRlvqTm5EfLESAOFNTspKSDGrMbRJN
         eUGZPCbz8QmOkVHS5AmL6Bfw67v3IaNTj0TorGfZ2ZBXlqsYRAEsUVEbAlsOo0IU5jNq
         goUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wxsKhS2l6+3Uh7nPOiKRBonKsZC+1QXIECJzcrgR1Zc=;
        b=TuahBTDDsivMfzCvKetaYTmz3oTrMiwoLvZquOZ6OWF091J1WXFIPR/hLw+e10vF1/
         u8rVi+Jt8+O+NYAvfEJ/blEch3Ks1jbwE9e2R25e8CwBTEXSPQSkk603JH+Ze5kWQh6r
         1uu0xlBAHF24wjb6zDUbzGBFCbsHHE/JgvEWE8cCefRRnSvFnV3yamU4XsffM9CWokUc
         QzgQQa8PoRPag7diIsmsN2eNlpPOOLIbalU89VU9lt8zPr4GEMy/0qsNEgmzfKntGcPK
         aEB2pb/1PVyamHPKwkIJAiGd0Els71polOkejy2ojgSLgdj9M7WSPVSmDMUl5jK0SWUw
         RQdw==
X-Gm-Message-State: AOAM530XbrkLBReIKmYePoB6ZtmVIpOFlEzCXlrWg9ddRuixKyagNttD
        nfFHKxaFizniRHA4zuV7SvSSSWtW
X-Google-Smtp-Source: ABdhPJyLGcrNZ4DqFSLYbSGiNdVPLDcdz21oM93jLWf+8IVO+GOyvGXQ2CKrf/YoWfUJFDFLZiWdiQ==
X-Received: by 2002:a17:90a:9503:: with SMTP id t3mr6172112pjo.171.1597337716520;
        Thu, 13 Aug 2020 09:55:16 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g8sm6566914pfo.132.2020.08.13.09.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 09:55:15 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 02/14] mips: bmips: add BCM3368 irq definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-3-noltari@gmail.com>
Message-ID: <54e3462e-4cad-a10b-3c33-6380d867d9f3@gmail.com>
Date:   Thu, 13 Aug 2020 09:55:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Add header with BCM3368 definitions in order to be able to include it from
> device tree files.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
