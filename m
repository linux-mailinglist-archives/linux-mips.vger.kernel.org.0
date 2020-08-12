Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355F5242B57
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 16:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgHLOYi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 10:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgHLOYh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 10:24:37 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AFDC061383;
        Wed, 12 Aug 2020 07:24:37 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id c10so2990619pjn.1;
        Wed, 12 Aug 2020 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ZSMja8pFDTdVnRaBkWP5xXwETYQor6z419NfCi8QJvQ=;
        b=ua0m+6zpiO+EzONWAO61mLM1o1wYjCMVBpsPwN09A1fJ6FpKXIr04uI19kNqsgi2Rz
         PTdLQSeJQLT0IYaKPFKR2VNQM97/h3QMnJWK7zNwW17L1lQ5oNCS7N8OjnlpJOTKfeIj
         c8UQqDpGvzaOPYE60WFIWJe5hn6flsuQDvHjNJonDQpxpVATi2P9mnG+zH9Ha6js8dpy
         +lKBfV0i9RGFtZoWnKibPi+Jpb1FG6YY3Y4LS6/Woj0b/UfmOP99xes2V9+Pauq0bt2C
         vGTW55hzHoqXcGYPnxzxOhb4x2K6ddhQn8Y+nuxC0+Nl6DVOIDpPcw4fvs7pp+UFbs8f
         5UOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZSMja8pFDTdVnRaBkWP5xXwETYQor6z419NfCi8QJvQ=;
        b=dneUCBJJ9JpzVJdlvTcNBLVxr/NSmpG4PHLJwAmKkUVfDBI0ZzUblu+qK6fSVFawUG
         FRdII16XsPaLW4VVA1dSyXwMdPuxvOSHvRAPXAsDrxavCv4wKc8pSBsJNmJDaW6XIslz
         p+R/tnrdT0Sn6PUJcfevboVLZh9yaRmPGTzEwa9QDzKtOzOxskKJs5wIrm4xqdtTjJdo
         0f5R2nOK6kuK1krVPGWesSSgYEoK63dFAlXN39RjiH31YTKRP3YnfC0McfoTs3qyTV4m
         Da688UK5fhAHbrUl0pd4BZcKdQNZrNlTe8okRMOb9opNkeKIIEcuzFM21FOctcZEo9ux
         Ax8Q==
X-Gm-Message-State: AOAM533YLMcGrpQ/z+ndqoueZEa16r87vMf4wrhwt+EiKKAcnnD2ARh/
        FEX8j5NOpQ+bFy8BZJj2l7PCAeVP
X-Google-Smtp-Source: ABdhPJyi+K98JvFqH7lTauLbPlp23x7mFh+TnDDJ57zawlm1Kar95zSWKMubn7y9ySMVdMLhZfp/qQ==
X-Received: by 2002:a17:90a:2169:: with SMTP id a96mr250085pje.132.1597242276784;
        Wed, 12 Aug 2020 07:24:36 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id c207sm2672002pfc.64.2020.08.12.07.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 07:24:35 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] MIPS: BCM63xx: switch to SPDX license identifier
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200812075235.366864-1-noltari@gmail.com>
 <20200812075235.366864-6-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <aeb79263-896b-54a1-4142-783bb32d4c16@gmail.com>
Date:   Wed, 12 Aug 2020 07:24:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812075235.366864-6-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/12/2020 12:52 AM, Álvaro Fernández Rojas wrote:
> Use SPDX license indentifier instead of local reference to COPYING.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
