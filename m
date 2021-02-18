Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBFC31EE83
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 19:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhBRSkM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 13:40:12 -0500
Received: from linux.microsoft.com ([13.77.154.182]:40026 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhBRSNZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Feb 2021 13:13:25 -0500
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 87BD020B6C40; Thu, 18 Feb 2021 10:12:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 87BD020B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1613671964;
        bh=Km9pKKcHiHwxHWao65MxAstktSSm3rLh98ggACdLHHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TJVehAwZpmV6HxLm9To2j3WbILy1f8iaQe6uTkq1v4Xug0j+58KHHzi3I7ulmqzim
         /7QVICAUtUxakIroP5Y9JzalE5jvOq3ikeNnn6slkcOATfTiIAlUOe3q/a9JcM+89m
         9WCNPQkFzNJCyAvMm7q6l/Zte8IgY+9y1dmhaBOo=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     allen.lkml@gmail.com
Cc:     apais@linux.microsoft.com, jens.wiklander@linaro.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, zajec5@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 0/2] optee: fix OOM seen due to tee_shm_free()
Date:   Thu, 18 Feb 2021 10:12:38 -0800
Message-Id: <1613671958-1307-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20210217092714.121297-1-allen.lkml@gmail.com>
References: <20210217092714.121297-1-allen.lkml@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Allen Pais <apais@linux.microsoft.com>

On Wed, 17 Feb 2021 14:57:12 +0530, Allen Pais wrote:
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

CC: linux-kernel@vger.kernel.org instead of linux-mips?
TEE / TrustZone is ARM.

Also, for Broadcom specific -
CC: bcm-kernel-feedback-list@broadcom.com

