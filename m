Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AF13225B5
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 07:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhBWGSJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 01:18:09 -0500
Received: from linux.microsoft.com ([13.77.154.182]:56442 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhBWGSF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 01:18:05 -0500
Received: from [192.168.0.114] (unknown [49.207.208.227])
        by linux.microsoft.com (Postfix) with ESMTPSA id 6B99520B6C40;
        Mon, 22 Feb 2021 22:17:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B99520B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1614061045;
        bh=lUNtrJvctvJzEcm1zYcLcrAroXBINRuq0RjqjDVmyfs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KT2/lZB44jCwhVMbSkk7ge2xvbpsHiCOTJmKxL+Igd5gJFpX48A56PJgYHZW+tcur
         OVVNTThZnd5E9/O71bUH76bQdH/kUvv2W5ntL0odWEzIKEGpB1+ZzSwBVljO1fHosT
         k9k+fEv2UIibl4CV/7I1tz5eQz8lIAh41STZA3wM=
Subject: Re: [PATCH 0/2] optee: fix OOM seen due to tee_shm_free()
To:     Allen Pais <allen.lkml@gmail.com>, jens.wiklander@linaro.org,
        zajec5@gmail.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
References: <20210217092714.121297-1-allen.lkml@gmail.com>
From:   Allen Pais <apais@linux.microsoft.com>
Message-ID: <7ed919a9-2ef3-95f3-3bf4-70961a18656a@linux.microsoft.com>
Date:   Tue, 23 Feb 2021 11:47:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217092714.121297-1-allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> 
> The following out of memory errors are seen on kexec reboot
> from the optee core.
>      
> [    0.368428] tee_bnxt_fw optee-clnt0: tee_shm_alloc failed
> [    0.368461] tee_bnxt_fw: probe of optee-clnt0 failed with error -22
>      
> tee_shm_release() is not invoked on dma shm buffer.
>      
> Implement .shutdown() in optee core as well as bnxt firmware driver
> to handle the release of the buffers correctly.
>      
> More info:
> https://github.com/OP-TEE/optee_os/issues/3637

Jens,

   Could you please take sometime out and review the series.

Thanks.

> 
> Allen Pais (2):
>    optee: fix tee out of memory failure seen during kexec reboot
>    firmware: tee_bnxt: implement shutdown method to handle kexec reboots
> 
>   drivers/firmware/broadcom/tee_bnxt_fw.c |  9 ++++
>   drivers/tee/optee/core.c                | 69 ++++++++++++++++++-------
>   2 files changed, 58 insertions(+), 20 deletions(-)
> 
