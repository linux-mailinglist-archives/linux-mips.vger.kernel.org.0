Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34AC17E268C
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 15:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjKFOXG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 09:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbjKFOXF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 09:23:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FD0B8
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 06:23:03 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E58C433C8;
        Mon,  6 Nov 2023 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699280582;
        bh=czgjeMzAlM0f3+zoTmIS1pn7c0Kb/7wz34wnZCierTc=;
        h=Date:From:To:Subject:From;
        b=YsygU9R4BD2a1l/Nh1X3UkK3kTfAs/c1fDIqBIV1CZU5Laps6pu8AudhwHrDR451O
         U7YKhUAQ026C/jzW7gg6zJ+LoVoYfs6KSpFuvgI+ryJqIGS1KMpXb++WSGoJsuzYh5
         p4cPnEFbpgb0T3e8xb+TRENaPhdoR6nnwX+rvWz4=
Date:   Mon, 6 Nov 2023 09:23:01 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-mips@vger.kernel.org
Subject: PSA: migrating linux-mips to new vger infrastructure
Message-ID: <20231106-impala-of-stereotyped-vitality-0ab945@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Good day!

I plan to migrate the linux-mips@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
